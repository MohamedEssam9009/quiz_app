import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';
import 'package:quiz_app/widgets/answer_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                'What is your favorite sports?',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
            Column(
              children: answersForFirstQuestion.map(
                (answerMap) {
                  return AnswerItem(answerMap: answerMap);
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
