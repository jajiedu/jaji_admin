import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/add_ctrl.dart';

// form ứng với thể loại đọc hiểu tổng hợp
class ReadingAddForm1Output extends StatefulWidget {
  @override
  _ReadingAddForm1OutputState createState() => _ReadingAddForm1OutputState();
}

class _ReadingAddForm1OutputState extends State<ReadingAddForm1Output> {
  final AddCtrl questionCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Đề bài(normal)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.content = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Đề bài(normal)'),
              )
            ],
          ),
          //Đề bài(furigana)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.content = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Đề bài(furigana)'),
              )
            ],
          ),
          //Đáp án 1
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 14, right: 8),
                      child: Radio(
                          value: 1,
                          groupValue: questionCtr.answer,
                          onChanged: (dynamic value) {
                            setState(() {
                              questionCtr.answer = value;
                            });
                          })),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.answerContent1 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 1'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 2,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.answerContent2 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 2'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 3
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 3,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.answerContent3 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 3'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 4,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.answerContent4 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 4'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Nhập nội dung phần giải thích
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.explain = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:
                    InputDecoration(labelText: 'Nhập nội dung phần giải thích'),
              )
            ],
          ),

          // Nhập nội dung cần gạch chân
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.addUnderline(text);
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:
                    InputDecoration(labelText: 'Nhập nội dung cần gạch chân'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
