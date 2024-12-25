import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(height: 10),
          Text(label),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
