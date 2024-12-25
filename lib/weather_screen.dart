import 'dart:convert';
import 'dart:ui';
import 'Hourly_forecast_item.dart';
import 'package:flutter/material.dart';
import 'additional_info_item.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    // URI: Uniform Resource Identifier
    // URL: Uniform resource Locator
    //URL is a sub type of URI
    try {
      String cityName = 'nigeria';
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey"),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != 200) {
        throw data['message'];
      }
      //  (data['main']['temp'] - 273.15).toStringAsFixed(1);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 239, 162, 18),
        title: Text(
          "Weather ⛅",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: [
          // GestureDetector(
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
                onTap: () => {
                      debugPrint("Refresh"),
                    },
                child: Icon(Icons.refresh)),
          ),
          // ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          print(snapshot);
          print(snapshot.runtimeType);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final String currentTemp;
          if (snapshot.hasData) {
            final data = snapshot.data as Map<String, dynamic>;
            currentTemp = (data['main']['temp'] - 275.15).toStringAsFixed(1);
            final currentSky = data['weather'][0]['main'];
            print(currentSky);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Main Card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                '$currentTemp°C',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'?
                                Icons.cloud:
                                Icons.sunny
                                , size: 55),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                currentSky == 'Clouds' || currentSky == 'Rain'?
                                "Cloudy":
                                "Sunny",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Weather Forecast Card
                  Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Weather Forecast",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForecastItem(
                          time: "3:30",
                          icon: Icons.cloud,
                          temperature: "34.5",
                        ),
                        HourlyForecastItem(
                          time: "4:30",
                          icon: Icons.sunny,
                          temperature: "30.5",
                        ),
                        HourlyForecastItem(
                          time: "6:30",
                          icon: Icons.cloud_done,
                          temperature: "34.5",
                        ),
                        HourlyForecastItem(
                          time: "9:30",
                          icon: Icons.cloud_queue,
                          temperature: "34.5",
                        ),
                        HourlyForecastItem(
                          time: "7:30",
                          icon: Icons.cloudy_snowing,
                          temperature: "34.5",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Addition Information Card
                  Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Additional Information",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfoItem(
                          icon: Icons.water_drop,
                          label: "Humidity",
                          value: "91",
                        ),
                        AdditionalInfoItem(
                            icon: Icons.air_outlined,
                            label: "Wind Speed",
                            value: "100"),
                        AdditionalInfoItem(
                            icon: Icons.beach_access_sharp,
                            label: "Pressure",
                            value: "1002"),
                      ]),
                ],
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
