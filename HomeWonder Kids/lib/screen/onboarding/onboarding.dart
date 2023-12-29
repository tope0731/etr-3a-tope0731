
import 'package:etr/screen/homepage/homepage.dart';
import 'package:etr/screen/onboarding/page1.dart';
import 'package:etr/screen/onboarding/page2.dart';
import 'package:etr/screen/onboarding/page3.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final PageController _controller = PageController();

  //for tracking of pageview
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                onFirstPage = (index != 0);
              });
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFfefefd),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePageScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0xFF4050b5),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  const Gap(555),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  const Gap(30),
                  onLastPage
                      ? SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFfefefd),
                              fixedSize: const Size(175, 50),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomePageScreen()),
                              );
                            },
                            child: const Text(
                              '''Let's Start!''',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4050b5),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFfefefd),
                              fixedSize: const Size(175, 50),
                            ),
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(
                              onFirstPage ? 'Next' : 'Begin',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4050b5),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                  const Gap(30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
