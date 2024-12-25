import 'dart:ui';
import 'Hourly_forecast_item.dart';
import 'package:flutter/material.dart';
import 'additional_info_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              child: Icon(Icons.refresh)
              ),
            ),
            // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            // Main Card
            SizedBox(              
              width: double.infinity,
              child: Card(                              
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(16) ),

                child: ClipRRect(                  
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 12,),
                        Text(
                          "300°F",
                          style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                        ),
                        const SizedBox(height: 12,),
                        Icon(Icons.cloud,size: 55),
                        const SizedBox(height: 12,),
                        Text("Rain",style: TextStyle(fontSize: 16),),
                        const SizedBox(height: 12,),
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
                  fontSize: 24,
                    fontWeight: FontWeight.bold),
                    )
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                            HourlyForecastItem(time: "3:30",icon: Icons.cloud ,temperature: "34.5",),
                            HourlyForecastItem(time: "4:30",icon: Icons.sunny, temperature: "30.5",),
                            HourlyForecastItem(time: "6:30",icon: Icons.cloud_done ,temperature: "34.5",),
                            HourlyForecastItem(time: "9:30",icon: Icons.cloud_queue ,temperature: "34.5",),
                            HourlyForecastItem(time: "7:30", icon: Icons.cloudy_snowing,temperature: "34.5",),   
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
                  fontSize: 24,
                    fontWeight: FontWeight.bold),
                    )
            ),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(icon: Icons.water_drop,label: "Humidity",value: "91",),
                AdditionalInfoItem(icon: Icons.air_outlined,label: "Wind Speed",value: "100"),
                AdditionalInfoItem(icon: Icons.beach_access_sharp,label: "Pressure",value: "1002"),                
            ]
            ) ,
            
          ],
        ),
      ),
    );
  }
}

