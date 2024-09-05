import 'package:flutter/material.dart';
import 'package:skysync/components/text.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlContainer extends StatelessWidget {
  final String title;
  String url1;
  UrlContainer({super.key, required this.title, required this.url1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(url1);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: CustomText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
