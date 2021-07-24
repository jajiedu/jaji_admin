import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reading_add_form1_ctrl.dart';

class ReadingAddQs2 extends StatelessWidget {
  ReadingAddQs2({
    Key? key,
    this.code,
  }) : super(key: key);
  String? code;
  ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.find();
  Widget makeWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Câu hỏi 1(normal)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updatesubQuestionNormal(text, 0, 0);
          },
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Câu hỏi ${code!}(normal)'),
        ),
        //Câu hỏi 1(furigana)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updatesubQuestionFurigana(text, 0, 0);
          },
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Câu hỏi${code!}(furigana)'),
        ),
        //Đáp án 1(normal)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updateAnswerNormal(text, 0, 0);
          },
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 1(normal)'),
        ),
        //Đáp án 1(furigana)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updateAnswerFurigana(text, 0, 0);
          },
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 1(furigana)'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
