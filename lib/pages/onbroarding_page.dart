import 'package:flutter/material.dart';
import 'package:flutter_netflix/pages/signin_page.dart';
import 'package:flutter_netflix/widgets/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar:
            true, // on met le body jusu'au appbar qui est mis aussi en transparent
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 80,
          leading: const Image(image: AssetImage("assets/images/symbol.png")),
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "PRIVACIY",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              // ontrolleur des pages
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Onboarding(
                  title: "Unlimited movies, TV, shows, amd more.",
                  subTitle: "Watch anywhere. Cancel anytime",
                  image: 'assets/images/onboarding/page1.png',
                ),
                Onboarding(
                  title: "There is a plan for every fan",
                  subTitle: "Plan starting at \$2.99 /month",
                  image: 'assets/images/onboarding/page2.png',
                ),
                Onboarding(
                  title: "Cancel online anytime",
                  subTitle: "Join today, no rason to wait",
                  image: 'assets/images/onboarding/page3.png',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 10,
                              width: _currentPage == index ? 20 : 10,
                              decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? Colors.red
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity, // pour occuper toute l'espace
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SigninPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: const Text("GET Started")),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
