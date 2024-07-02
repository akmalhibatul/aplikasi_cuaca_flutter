import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_info_item.dart';
import '../widgets/weather_forecast_item.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isDarkMode = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '12 March 2021',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        weatherProvider.weather?.cityName ?? 'City, Country',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor: Colors.white,
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Text(
                      weatherProvider.weather != null
                          ? '${weatherProvider.weather!.temperature.toStringAsFixed(0)}°'
                          : '23°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    weatherProvider.weather != null
                        ? Image.network(
                            'http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png',
                            width: 300,
                            height: 300,
                          )
                        : Image.asset(
                            'assets/cloudy.png',
                            width: 100,
                            height: 100,
                          ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherInfoItem(
                          icon: Icons.air,
                          value: weatherProvider.weather != null
                              ? '${weatherProvider.weather!.windSpeed} km/h'
                              : '7 km/h',
                          description: 'Wind',
                        ),
                        WeatherInfoItem(
                          icon: Icons.water_drop,
                          value: weatherProvider.weather != null
                              ? '${weatherProvider.weather!.humidity}%'
                              : '28%',
                          description: 'Humidity',
                        ),
                        WeatherInfoItem(
                          icon: Icons.visibility,
                          value: weatherProvider.weather != null
                              ? '${(weatherProvider.weather!.visibility / 1000).toStringAsFixed(0)} km'
                              : '20 km',
                          description: 'Visibility',
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Next 7 Days',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherForecastItem(
                          time: '13:00',
                          icon:
                              'assets/sunny.png', // Ganti dengan path ikon cuaca Anda
                          temperature: '26°',
                        ),
                        WeatherForecastItem(
                          time: '14:00',
                          icon:
                              'assets/thunderstorm.png', // Ganti dengan path ikon cuaca Anda
                          temperature: '26°',
                        ),
                        WeatherForecastItem(
                          time: '15:00',
                          icon:
                              'assets/cloudy.png', // Ganti dengan path ikon cuaca Anda
                          temperature: '23°',
                        ),
                        WeatherForecastItem(
                          time: '16:00',
                          icon:
                              'assets/sunny.png', // Ganti dengan path ikon cuaca Anda
                          temperature: '28°',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter City',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        weatherProvider.fetchWeather(_controller.text);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
