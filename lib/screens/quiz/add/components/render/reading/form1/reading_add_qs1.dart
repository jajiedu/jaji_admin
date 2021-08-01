import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reading_add_form1_ctrl.dart';

class ReadingAddQs1 extends StatelessWidget {
  ReadingAddQs1({Key? key, this.code, this.indexOfPage, this.indexOfTextCtrl})
      : super(key: key);
  String? code;
  int? indexOfPage;
  List<int>? indexOfTextCtrl;
  ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.find();
  Widget makeWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        //Câu hỏi 1(normal)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updatesubQuestionNormal(text, indexOfPage!, 0);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![0]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Câu hỏi ${code!}(normal)'),
        ),
        //Câu hỏi 1(furigana)
        TextFormField(
          onChanged: (text) {
            readingAddForm1Ctrl.updatesubQuestionFurigana(
                text, indexOfPage!, 0);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![1]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Câu hỏi${code!}(furigana)'),
        ),
        //Đáp án 1(normal)
        TextFormField(
          onChanged: (text) {
            // readingAddForm1Ctrl.updateAnswerNormal(text, indexOfPage!, 0);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![2]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 1(normal)'),
        ),
        //Đáp án 1(furigana)
        TextFormField(
          onChanged: (text) {
            // readingAddForm1Ctrl.updateAnswerFurigana(text, indexOfPage!, 0);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![3]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 1(furigana)'),
        ),
        //Đáp án 2(normal)
        TextFormField(
          onChanged: (text) {
            // readingAddForm1Ctrl.updateAnswerNormal(text, indexOfPage!, 1);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![4]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 2(normal)'),
        ),
        //Đáp án 2(furigana)
        TextFormField(
          onChanged: (text) {
            //readingAddForm1Ctrl.updateAnswerFurigana(text, indexOfPage!, 1);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![5]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 2(furigana)'),
        ),
        //Đáp án 3(normal)
        TextFormField(
          onChanged: (text) {
            //readingAddForm1Ctrl.updateAnswerNormal(text, indexOfPage!, 2);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![6]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 3(normal)'),
        ),
        //Đáp án 3(furigana)
        TextFormField(
          onChanged: (text) {
            //readingAddForm1Ctrl.updateAnswerFurigana(text, indexOfPage!, 2);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![7]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 3(furigana)'),
        ),
        //Đáp án 4(normal)
        TextFormField(
          onChanged: (text) {
            // readingAddForm1Ctrl.updateAnswerNormal(text, indexOfPage!, 3);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![8]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 4(normal)'),
        ),
        //Đáp án 4(furigana)
        TextFormField(
          onChanged: (text) {
            // readingAddForm1Ctrl.updateAnswerFurigana(text, indexOfPage!, 3);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![9]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Đáp án 4(furigana)'),
        ),
        Obx(
          () => Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue:
                          readingAddForm1Ctrl.radioValueQs![indexOfPage!].value,
                      onChanged: (dynamic value) {
                        readingAddForm1Ctrl.updateValueRadio(
                            value, indexOfPage!);
                      }),
                  Text('Đáp án 1')
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue:
                          readingAddForm1Ctrl.radioValueQs![indexOfPage!].value,
                      onChanged: (dynamic value) {
                        readingAddForm1Ctrl.updateValueRadio(
                            value, indexOfPage!);
                      }),
                  Text('Đáp án 2')
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Radio(
                      value: 3,
                      groupValue:
                          readingAddForm1Ctrl.radioValueQs![indexOfPage!].value,
                      onChanged: (dynamic value) {
                        readingAddForm1Ctrl.updateValueRadio(
                            value, indexOfPage!);
                      }),
                  Text('Đáp án 3')
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Radio(
                      value: 4,
                      groupValue:
                          readingAddForm1Ctrl.radioValueQs![indexOfPage!].value,
                      onChanged: (dynamic value) {
                        readingAddForm1Ctrl.updateValueRadio(
                            value, indexOfPage!);
                      }),
                  Text('Đáp án 4')
                ],
              ))
            ],
          ),
        ),
        // Nhập nội dung phần giải thích
        TextFormField(
          onChanged: (text) {
            // questionCtr.explain = text;
            readingAddForm1Ctrl.updateExplain(text, indexOfPage!);
          },
          controller: readingAddForm1Ctrl.textCtrls[indexOfTextCtrl![10]],
          cursorColor: Colors.deepPurpleAccent,
          minLines: 2,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration:
              InputDecoration(labelText: 'Nhập nội dung phần giải thích'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
