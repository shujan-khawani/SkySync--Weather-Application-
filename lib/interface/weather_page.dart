import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skysync/components/container.dart';
import 'package:skysync/components/text.dart';
import 'package:skysync/consts/consts.dart';
import 'package:skysync/interface/about_page.dart';
import 'package:skysync/model/weather_model.dart';
import 'package:skysync/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Api Key
  final _weatherServices = WeatherServices(apiKey: API_KEY);
  WeatherModel? _weather;
  //Fetch Weather
  _fetchWeather() async {
    //Get City
    String cityName = await _weatherServices.getCurrentCity();
    //Get Weather
    try {
      final weather = await _weatherServices.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    //error
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  //Weather Anims
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null)
      return 'assets/animations/Loading Animation.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'haze':
      case 'dust':
        return 'assets/animations/Cloudy.json';
      case 'sunny':
        return 'assets/animations/Sunny.json';
      case 'rain':
        return 'assets/animations/Storm.json';
      case 'thunderstorm':
        return 'assets/animations/Thunder.json';
      case 'fog':
        return 'assets/animations/Fog.json';
      case 'smoke':
        return 'assets/animations/Smoke.json';
      default:
        return 'assets/animations/Sunny.json';
    }
  }

  //initial State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Fetch the Weather
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('SkySync'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.question_mark_rounded,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: _weather?.cityName ?? 'Fetching City',
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomContainer(
                          title: 'Temperature:',
                          subtitle: '${_weather?.temperature.round()}°C',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: CustomContainer(
                          title: 'Condition:',
                          subtitle: _weather?.mainCondition ?? 'Fetching',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomContainer(
                          title: 'Humidity:',
                          subtitle:
                              '${_weather?.humidity!.toStringAsFixed(0)} %',
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: CustomContainer(
                          title: 'Wind Speed:',
                          subtitle:
                              '${_weather?.windSpeed!.toStringAsFixed(0)} m/s',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
