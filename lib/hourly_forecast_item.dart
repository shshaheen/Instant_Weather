import 'package:flutter/material.dart';
import 'dart:ui';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Icon(
                    icon,
                    size: 32,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    temperature,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
