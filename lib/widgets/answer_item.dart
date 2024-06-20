import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_item_model.dart';

class AnswerItem extends StatelessWidget {
  final AnswerItemModel answerMap;
  final VoidCallback questionIndexChangeCallBack;

  const AnswerItem({
    super.key,
    required this.answerMap,
    required this.questionIndexChangeCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  size: 30.0,
                ),
                const SizedBox(width: 12.0),
                Text(answerMap.title),
              ],
            ),
          ),
        ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     answerMap.onPressed();
        //     questionIndexChangeCallBack();
        //   },
        //   child: Text(answerMap.title),
        // ),
      ),
    );
  }
}
