import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';
import 'package:quiz_app/models/question_item_model.dart';
import 'package:quiz_app/widgets/answer_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                questions[questionIndex].title,
                style: const TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
            Column(
              children: questions[questionIndex].availableAnswers.map(
                (answerMap) {
                  return AnswerItem(
                    answerMap: answerMap,
                    questionIndexChangeCallBack: () {
                      if (questionIndex + 1 < questions.length) {
                        setState(() {
                          questionIndex += 1;
                        });
                      }
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
