import 'package:etr/screen/camera/camera.dart';
import 'package:etr/screen/quiz/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/gif/home.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(71),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'HomeWonder Kids ',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFc25d5d),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(50),
                Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF89CFF3), width: 7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/gif/cute.gif',
                    height: 190,
                    width: 190,
                  ),
                ),
                const Gap(40),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const CameraScreen(),
                      ),
                    );
                  },
                  child: SimpleShadow(
                    opacity: 0.3,
                    color: Colors.black,
                    offset: const Offset(3, 4),
                    sigma: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/gif/exploreee.png',
                        height: 100,
                        width: 320,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const QuestionWidget(),
                      ),
                    );
                  },
                  child: SimpleShadow(
                    opacity: 0.3,
                    color: Colors.black,
                    offset: const Offset(3, 4),
                    sigma: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/gif/aaa.png',
                        height: 100,
                        width: 320,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
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
