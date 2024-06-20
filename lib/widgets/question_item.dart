import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_item_model.dart';

class QuestionItem extends StatelessWidget {
  final QuestionItemModel questionsItem;
  const QuestionItem({super.key, required this.questionsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionsItem.title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 12.0),
          Text(
            'Answer and get points',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
