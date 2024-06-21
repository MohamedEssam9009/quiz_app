import 'package:flutter/material.dart';

import '../models/answer_item_model.dart';

class AnswerItem extends StatelessWidget {
  final AnswerItemModel answerMap;
  final bool isAnswerChosen;
  final VoidCallback questionIndexChangeCallBack;

  const AnswerItem({
    super.key,
    required this.answerMap,
    required this.questionIndexChangeCallBack,
    required this.isAnswerChosen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: InkWell(
          onTap: () {
            answerMap.onPressed();
            questionIndexChangeCallBack();
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
              ),
              color: isAnswerChosen ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 30.0,
                    color: isAnswerChosen ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    answerMap.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: isAnswerChosen ? Colors.white : Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
