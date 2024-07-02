import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String description;

  const WeatherInfoItem({
    required this.icon,
    required this.value,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 28),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
