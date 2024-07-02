import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;

  const WeatherForecastItem({
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Image.asset(
          icon, // Ganti dengan path ikon cuaca Anda
          width: 40,
          height: 40,
        ),
        SizedBox(height: 8),
        Text(
          temperature,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
