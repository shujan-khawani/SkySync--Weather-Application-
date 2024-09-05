class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? 'City Not Found',
      temperature: (json['main']?['temp'])?.toDouble() ?? 0.0,
      mainCondition: json['weather']?[0]['main'] ?? 'Unknown',
      humidity: json['main']?['humidity'] ?? 0,
      windSpeed: (json['wind']?['speed'])?.toDouble() ?? 0.0,
    );
  }
}
