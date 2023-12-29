import 'package:etr/model/model.dart';
import 'package:etr/screen/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_shadow/simple_shadow.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/gif/game1.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3056dd),
                      border:
                          Border.all(color: const Color(0xFF3056dd), width: 7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$_questionNumber/${questions.length}',
                      style: const TextStyle(
                          color: Color(0xFFF2F2F2),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: PageView.builder(
                      itemCount: questions.length,
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final _question = questions[index];
                        return buildQuestion(_question);
                      },
                    ),
                  ),
                  _isLocked ? buildElevatedButton() : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: SimpleShadow(
            opacity: 0.3,
            color: Colors.black,
            offset: const Offset(2, 3),
            sigma: 1,
            child: Container(
              height: 140,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF89CFF3), width: 7),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF89CFF3),
              ),
              child: Center(
                child: Text(
                  question.text,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF89CFF3), width: 7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                question.imagePath,
                height: 180,
                width: 180,
              ),
            ),
          ],
        ),
        const Gap(8),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.isLocked;
                if (question.selectedOption!.inCorrect) {
                  _score++;
                }
              }
            },
          ),
        )
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3056dd),
      ),
      onPressed: () {
        if (_questionNumber < questions.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            _questionNumber++;
            _isLocked = false;
          });
        } else {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (_) => ResultPage(score: _score),
            ),
          );
        }
      },
      child: Text(
          _questionNumber < questions.length ? 'Next Page' : 'See the Result'),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);

    return SimpleShadow(
      opacity: 0.25,
      color: Colors.black,
      offset: const Offset(2, 2),
      sigma: 1,
      child: GestureDetector(
        onTap: () => onClickedOption(option),
        child: Container(
          height: 55,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF89CFF3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color, width: 3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option.text,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              getIconForOption(option, question)
            ],
          ),
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.inCorrect ? Colors.green : Colors.red;
      } else if (option.inCorrect) {
        return Colors.green;
      }
    }
    return const Color(0xFF89CFF3);
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.inCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.inCorrect) {
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
        );
      }
    }
    return const SizedBox.shrink();
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.score}) : super(key: key);

  final int score;

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
                "assets/gif/result.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Gap(30),
              Image.asset(
                'assets/gif/congrats.gif',
                height: 300,
                width: 300,
              ),
              const Gap(60),
              const Center(
                child: Text(
                  'You Scored',
                  style: TextStyle(
                      color: Color(0xFF3056dd),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  '$score/${questions.length}',
                  style: const TextStyle(
                      color: Color(0xFF3056dd),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(100),
              SimpleShadow(
                opacity: 0.3,
                color: Colors.black,
                offset: const Offset(3, 4),
                sigma: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3056dd),
                    minimumSize: const Size(300, 60),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const HomePageScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
