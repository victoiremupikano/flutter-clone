import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_netflix/pages/onbroarding_page.dart';
import 'package:lottie/lottie.dart';

class MyLoadingPage extends StatefulWidget {
  const MyLoadingPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoadingPage> createState() => _MyLoadingPageState();
}

class _MyLoadingPageState extends State<MyLoadingPage> {
  @override
  void initState() {
    super.initState();
    loadingAnimation();
  }

  // elle va appeler onLoaded apres trois second
  Future<Timer> loadingAnimation() async {
    return Timer(const Duration(seconds: 3), onLoaded);
  }

  // apres chargement on appelca pour changer de page
  onLoaded() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/lotties/netflix.json", repeat: false),
      ),
    );
  }
}
