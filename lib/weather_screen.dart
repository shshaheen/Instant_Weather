import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
     
    );
  }
}
