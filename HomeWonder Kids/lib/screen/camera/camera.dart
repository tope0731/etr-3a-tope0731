import 'dart:io';
import 'package:camera/camera.dart';
import 'package:etr/main.dart';
import 'package:etr/screen/camera/object_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _nameState();
}

class _nameState extends State<CameraScreen> {
  late CameraController _controller;
  File? file;
  var _recognitions;
  var v = "";

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model/model.tflite",
      labels: "assets/model/label.txt",
    );
  }

  Future detectimage(String image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
    });

    return v;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Icon(
              Icons.error,
              size: 50,
              color: Colors.red.shade500,
            ),
            content: const Text(
                'The image is too blurry or unclear. Please capture a sharp and well-lit image.'),
            actions: [
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Got it!'),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
              ),
              //replace with our own icon data.
            )),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(_controller),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: IconButton(
                      onPressed: () async {
                        try {
                          await _controller.setFlashMode(FlashMode.auto);
                          XFile file = await _controller.takePicture();
                          await detectimage(file.path);
                          //eto yung tama
                          if (_recognitions[0]['confidence'] < .98) {
                            print("try again");
                            _showDialog();
                          } else {
                            var flabel = _recognitions[0]['label'].toString();
                            var confidence = _recognitions[0]['confidence'];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ObjectDescription(file, flabel, confidence),
                              ),
                            );
                          }
                        } on CameraException catch (e) {
                          debugPrint("Error occured while taking picture : $e");
                          return;
                        }
                      },
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 70,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
