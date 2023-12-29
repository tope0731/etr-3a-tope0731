import 'package:camera/camera.dart';
import 'package:etr/screen/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const iSee());
}

class iSee extends StatelessWidget {
  const iSee({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoardingScreen(),
    );
  }
}
