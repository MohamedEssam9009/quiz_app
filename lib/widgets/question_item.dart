import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_item_model.dart';

class QuestionItem extends StatelessWidget {
  final QuestionItemModel questionsItem;
  const QuestionItem({super.key, required this.questionsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Text(
        questionsItem.title,
        style: const TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      ),
    );
  }
}
