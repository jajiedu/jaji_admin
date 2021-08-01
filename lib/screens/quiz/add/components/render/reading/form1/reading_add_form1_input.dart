import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/constant/constants.dart';
import 'package:jaji_admin/screens/quiz/add/add_ctrl.dart';
import 'reading_add_form1_ctrl.dart';
import 'reading_add_qs_input_router.dart';

// form ứng với thể loại đọc hiểu tổng hợp
class ReadingAddForm1Input extends StatefulWidget {
  @override
  _ReadingAddForm1InputState createState() => _ReadingAddForm1InputState();
}

class _ReadingAddForm1InputState extends State<ReadingAddForm1Input> {
  final AddCtrl questionCtr = Get.find();
  ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.put(ReadingAddForm1Ctrl());

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
                  readingAddForm1Ctrl.updateQuestionNormal(text);
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
                  readingAddForm1Ctrl.updateQuestionFurigana(text);
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Đề bài(furigana)'),
              )
            ],
          ),
          //Đề bài(translate)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  readingAddForm1Ctrl.updateQuestionTranslate(text2);
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(labelText: 'Đề bài(translate)'),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCode('1');
                    },
                    child: Text('Câu hỏi 1')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCode('2');
                    },
                    child: Text('Câu hỏi 2')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCode('3');
                    },
                    child: Text('Câu hỏi 3')),
              )
            ],
          ),
          Obx(() => ReadingAddQsInputRouter(readingAddForm1Ctrl.code.value)),
        ],
      ),
    );
  }
}
