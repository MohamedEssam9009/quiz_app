import 'package:flutter/material.dart';

import '../models/question_item_model.dart';
import '../widgets/answer_item.dart';
import '../widgets/question_item.dart';
import '../widgets/total_score_part.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0, myTotalScore = 0;
  int answerChosen = -1;
  int resultedScore = questions.length * 10;
  bool showTotalScore = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('totalScore: $myTotalScore');
    showTotalScore = myTotalScore >= resultedScore;
    return Scaffold(
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
                      children: List.generate(
                        questions[questionIndex].availableAnswers.length,
                        (index) => AnswerItem(
                          answerMap:
                              questions[questionIndex].availableAnswers[index],
                          isAnswerChosen: answerChosen == index,
                          questionIndexChangeCallBack: () {
                            setState(() {
                              answerChosen = index;
                            });
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (questionIndex + 1 < questions.length) {
                            setState(() {
                              questionIndex += 1;
                            });
                          }
                          setState(() {
                            myTotalScore += 10;
                            answerChosen = -1;
                          });
                        },
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
