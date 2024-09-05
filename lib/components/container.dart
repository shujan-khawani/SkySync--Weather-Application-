import 'package:flutter/material.dart';
import 'package:skysync/components/text.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomContainer(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: subtitle,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
