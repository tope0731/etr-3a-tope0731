import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xAAC3EEFF),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/gif/onboarding2.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(85),
                Container(
                  height: 350,
                  width: 300,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF00c4de), width: 7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/gif/P1.jpg',
                    height: 350,
                    width: 350,
                  ),
                ),
                const Gap(15),
                const Text(
                  '''Let's Begin''',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4050b5)),
                ),
                const Gap(10),
                const Center(
                  child: Text(
                    'Start your journey by tapping the "Begin" button. The world of objects awaits your exploration!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4050b5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
