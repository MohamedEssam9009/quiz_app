import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class AnswerItem extends StatelessWidget {
  final AnswerItemModel answerMap;

  const AnswerItem({super.key, required this.answerMap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 40.0,
        child: ElevatedButton(
          onPressed: answerMap.onPressed,
          child: Text(answerMap.title),
        ),
      ),
    );
  }
}
