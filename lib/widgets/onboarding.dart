import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  Onboarding({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Positioned.fill(
            child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ))
      ],
    );
  }
}
