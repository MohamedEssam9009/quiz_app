import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answersForFirstQuestion = [
      {
        'title': 'Football',
        'onPressed': () => debugPrint('Football Choice'),
      },
      {
        'title': 'Basketball',
        'onPressed': () => debugPrint('Basketball Choice'),
      },
      {
        'title': 'Volleyball',
        'onPressed': () => debugPrint('Volleyball Choice'),
      },
      {
        'title': 'KicBoxing',
        'onPressed': () => debugPrint('KicBoxing Choice'),
      },
    ];
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: answerMap['onPressed'],
                        child: Text(answerMap['title']),
                      ),
                    ),
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
