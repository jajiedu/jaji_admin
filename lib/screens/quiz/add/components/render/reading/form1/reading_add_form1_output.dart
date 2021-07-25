import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/add_ctrl.dart';
import 'reading_add_form1_ctrl.dart';
import 'reading_add_qs_output_router.dart';
import 'reading_add_qs_widget.dart';

// form ứng với thể loại đọc hiểu tổng hợp
class ReadingAddForm1Output extends StatefulWidget {
  @override
  _ReadingAddForm1OutputState createState() => _ReadingAddForm1OutputState();
}

class _ReadingAddForm1OutputState extends State<ReadingAddForm1Output> {
  final AddCtrl questionCtr = Get.find();
  ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.put(ReadingAddForm1Ctrl());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Đề bài
          Text(
            'Đề bài: ',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
              readingAddForm1Ctrl.quizModel.value.questionNormal,
              readingAddForm1Ctrl.quizModel.value.questionFurigana)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCodeQsAs(0);
                    },
                    child: Text('Câu hỏi 1')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCodeQsAs(1);
                    },
                    child: Text('Câu hỏi 2')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      readingAddForm1Ctrl.updateCodeQsAs(2);
                    },
                    child: Text('Câu hỏi 3')),
              )
            ],
          ),
          Obx(() =>
              ReadingAddQsOutputRouter(readingAddForm1Ctrl.codeQsAs.value)),
          TextButton(
              onPressed: () {
                readingAddForm1Ctrl.saveQsAs();
              },
              child: Text('Lưu câu hỏi'))
        ],
      ),
    );
  }
}
