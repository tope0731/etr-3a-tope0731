import 'dart:io';
import 'package:camera/camera.dart';
import 'package:etr/model/object.dart';
import 'package:etr/screen/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ObjectDescription extends StatefulWidget {
  ObjectDescription(this.file, this.label, this.confidence, {super.key});

  XFile file;
  var label;
  var confidence;

  @override
  State<ObjectDescription> createState() => _ObjectDescriptionState();
}

class _ObjectDescriptionState extends State<ObjectDescription> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    XFile files = XFile(widget.file.path);
    File picture = File(widget.file.path);
    String label = widget.label;
    int object = 0;

    if (widget.label == 'BAG') {
      object = 0;
    } else if (widget.label == 'BOOK') {
      object = 1;
    } else if (widget.label == 'CHAIR') {
      object = 2;
    } else if (widget.label == 'RULER') {
      object = 3;
    } else if (widget.label == 'PENCIL') {
      object = 4;
    } else if (widget.label == 'NOTEBOOK') {
      object = 5;
    } else if (widget.label == 'CRAYONS') {
      object = 6;
    } else if (widget.label == 'ERASER') {
      object = 7;
    } else if (widget.label == 'SHOES') {
      object = 8;
    } else if (widget.label == 'SCISSORS') {
      object = 9;
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFF3056dd),
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
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const HomePageScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const Gap(8),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Color(0xFFfdfdfd)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  flag
                                      ? widget.label
                                      : objectData[object]['pangalan']
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                //pronounciation
                                Text(
                                  flag
                                      ? objectData[object]['pronun'].toString()
                                      : objectData[object]['pagsasalita']
                                          .toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF89CFF3), width: 4),
                              ),
                              height: 150,
                              width: 88,
                              child: Image.file(
                                picture,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: flag
                                      ? const Color(0xFF3056dd)
                                      : const Color(0xFF9fe0f5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                                child: const Text('English'),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: flag
                                      ? const Color(0xFF9fe0f5)
                                      : const Color(0xFF3056dd),
                                ),
                                onPressed: () {
                                  setState(() {
                                    flag = false;
                                  });
                                },
                                child: const Text('Filipino'),
                              ),
                            ),
                          ],
                        ),
                        const Gap(30),
                        Text(
                          flag ? 'Definition' : 'Kahulugan',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          flag
                              ? objectData[object]['description'].toString()
                              : objectData[object]['kahulugan'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Gap(60),
                        Text(
                          flag ? 'Examples' : 'Halimbawa',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        const Gap(10),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFF3056dd),
                            child: Text('1'),
                          ),
                          title: Text(flag
                              ? objectData[object]['s1'].toString()
                              : objectData[object]['p1'].toString()),
                        ),
                        const Gap(10),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFF3056dd),
                            child: Text('2'),
                          ),
                          title: Text(flag
                              ? objectData[object]['s2'].toString()
                              : objectData[object]['p2'].toString()),
                        ),
                        const Gap(10),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFF3056dd),
                            child: Text('3'),
                          ),
                          title: Text(flag
                              ? objectData[object]['s3'].toString()
                              : objectData[object]['p3'].toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
