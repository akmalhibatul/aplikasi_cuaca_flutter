class Weather {
  final String cityName;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final int visibility;
  final String icon;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.visibility,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      visibility: json['visibility'],
      icon: json['weather'][0]['icon'],
    );
  }
}
