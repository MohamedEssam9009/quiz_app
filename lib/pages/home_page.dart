import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_item_model.dart';
import 'package:quiz_app/widgets/answer_item.dart';
import 'package:quiz_app/widgets/question_item.dart';
import 'package:quiz_app/widgets/total_score_part.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;
  int myTotalScore = 0;
  int resultedScore = questions.length * 10;
  bool showTotalScore = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('totalScore: $myTotalScore');
    showTotalScore = myTotalScore >= resultedScore;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Quiz App'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: !showTotalScore
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50.0),
                    QuestionItem(questionsItem: questions[questionIndex]),
                    const SizedBox(height: 30.0),
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
                              setState(() {
                                myTotalScore += 10;
                              });
                            },
                          );
                        },
                      ).toList(),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              )
            : TotalScorePart(
                myTotalScore: myTotalScore,
                resetQuizOnPressed: () {
                  setState(() {
                    questionIndex = 0;
                    myTotalScore = 0;
                  });
                },
              ),
      ),
    );
  }
}
