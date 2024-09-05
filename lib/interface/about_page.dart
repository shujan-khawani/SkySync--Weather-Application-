import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skysync/components/text.dart';
import 'package:skysync/components/url_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('SkySync'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset('assets/animations/About.json'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomText(
                          text: 'About Section',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                                text: 'App Name:',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: 'SkySync',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                                text: 'Developed By:',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: 'Shujan Khakwani',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                                text: 'Contact:',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: '0306-1515581',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                                text: 'Job Stauts:',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: 'Available For Hiring',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: UrlContainer(
                                title: 'GitHub',
                                url1: 'https://github.com/shujan-khawani',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: UrlContainer(
                                title: 'LinkedIn',
                                url1:
                                    'https://www.linkedin.com/in/shujan-khakwani-1428a1316/',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: UrlContainer(
                                title: 'Instagram',
                                url1:
                                    'https://www.instagram.com/shujan_khakwanii/',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
