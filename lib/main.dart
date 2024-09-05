import 'package:flutter/material.dart';
import 'package:skysync/interface/splash_page';
import 'package:skysync/theme/themes.dart';

void main() {
  runApp(const SkySync());
}

class SkySync extends StatelessWidget {
  const SkySync({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const SplashScreen(),
    );
  }
}
