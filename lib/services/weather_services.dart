import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skysync/consts/consts.dart';
import 'package:skysync/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey;
  WeatherServices({required this.apiKey});

  //Function to get Weather
  Future<WeatherModel> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    //Permission to get Location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //Current Location
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //Converting Location into Placemark Objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //Extracting CityName
    String? city = placemarks[0].locality;

    return city ?? 'Unknown City';
  }
}
