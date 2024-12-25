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
    try {
      String cityName = 'kurnool'; // Replace with dynamic city if needed
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey"),
      );

      // Check for successful response
      if (res.statusCode != 200) {
        throw Exception("Failed to load weather data: ${res.statusCode}");
      }

      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather ⛅",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () => {
                debugPrint("Refresh"),
                setState(() {}), // Trigger a refresh
              },
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            final data = snapshot.data as Map<String, dynamic>;
            final currentTemp = (data['list'][0]['main']['temp'] - 273.15)
                .toStringAsFixed(1); // Corrected temperature conversion
            final currentSky = data['list'][0]['weather'][0]['main'];
            final pressure = data['list'][0]['main']['pressure'];
            final humidity = data['list'][0]['main']['humidity'];
            final windSpeed = data['list'][0]['wind']['speed'];
            // print(data['list'][0]['dt_txt']);
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
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Column(
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                '$currentTemp°C',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : currentSky == 'Clear'
                                        ? Icons.sunny
                                        : Icons.cloud_queue,
                                size: 55,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                currentSky == 'Clouds'
                                    ? "Cloudy"
                                    : currentSky == 'Rain'
                                        ? "Rainy"
                                        : "Sunny",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 12),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
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

                  // Additional Information Card
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Additional Information",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: humidity.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.air_outlined,
                        label: "Wind Speed",
                        value: windSpeed.toString(),
                      ),
                      AdditionalInfoItem(
                        icon: Icons.beach_access_sharp,
                        label: "Pressure",
                        value: pressure.toString(),
                      ),
                    ],
                  ),
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
