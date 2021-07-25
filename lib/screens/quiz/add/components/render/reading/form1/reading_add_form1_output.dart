import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/add_ctrl.dart';
import 'package:ruby_text/ruby_text/ruby_text.dart';

import 'reading_add_form1_ctrl.dart';

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
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl.quizModel.value.questionNormal,
              readingAddForm1Ctrl.quizModel.value.questionFurigana)),
          // câu hỏi 1
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl
                  .quizModel.value.listSubQuestion![0].subQuestionNormal,
              readingAddForm1Ctrl
                  .quizModel.value.listSubQuestion![0].subQuestionFurigana)),
          // Đáp án 1
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![0].answerNormal,
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![0].answerFurigana)),
          // Đáp án 2
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![1].answerNormal,
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![1].answerFurigana)),
          // Đáp án 3
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![2].answerNormal,
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![2].answerFurigana)),
          // Đáp án 4
          Obx(() => readingAddForm1Ctrl.getTextWidgets(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![3].answerNormal,
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![0]
                  .listSubQuestion![3].answerFurigana)),
          // GetBuilder<ReadingAddForm1Ctrl>(
          //     // specify type as Controller
          //     init: ReadingAddForm1Ctrl(), // intialize with the Controller
          //     builder: (value) => value.getTextWidgets(
          //         value.quizModel.value.questionNormal,
          //         value.quizModel.value.questionFurigana)),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     // Obx(
          //     //   () => Text.rich(TextSpan(
          //     //       children: readingAddForm1Ctrl
          //     //           .quizModel.value.questionNormal!
          //     //           .map<InlineSpan>((e) => WidgetSpan(child: Text(e)))
          //     //           .toList())),
          //     // )
          //   ],
          // ),
          // //Đáp án 1
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new Row(
          //       children: <Widget>[
          //         Padding(
          //             padding: const EdgeInsets.only(top: 14, right: 8),
          //             child: Radio(
          //                 value: 1,
          //                 groupValue: questionCtr.answer,
          //                 onChanged: (dynamic value) {
          //                   setState(() {
          //                     questionCtr.answer = value;
          //                   });
          //                 })),
          //         new Flexible(
          //           child: new TextField(
          //             onChanged: (text) {
          //               questionCtr.answerContent1 = text;
          //             },
          //             decoration: InputDecoration(labelText: 'Nhập đáp án 1'),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // //Đáp án 2
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new Row(
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.only(top: 14, right: 8),
          //           child: Radio(
          //               value: 2,
          //               groupValue: questionCtr.answer,
          //               onChanged: (dynamic value) {
          //                 setState(() {
          //                   questionCtr.answer = value;
          //                 });
          //               }),
          //         ),
          //         new Flexible(
          //           child: new TextField(
          //             onChanged: (text) {
          //               questionCtr.answerContent2 = text;
          //             },
          //             decoration: InputDecoration(labelText: 'Nhập đáp án 2'),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // //Đáp án 3
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new Row(
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.only(top: 14, right: 8),
          //           child: Radio(
          //               value: 3,
          //               groupValue: questionCtr.answer,
          //               onChanged: (dynamic value) {
          //                 setState(() {
          //                   questionCtr.answer = value;
          //                 });
          //               }),
          //         ),
          //         new Flexible(
          //           child: new TextField(
          //             onChanged: (text) {
          //               questionCtr.answerContent3 = text;
          //             },
          //             decoration: InputDecoration(labelText: 'Nhập đáp án 3'),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // //Đáp án 4
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     new Row(
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.only(top: 14, right: 8),
          //           child: Radio(
          //               value: 4,
          //               groupValue: questionCtr.answer,
          //               onChanged: (dynamic value) {
          //                 setState(() {
          //                   questionCtr.answer = value;
          //                 });
          //               }),
          //         ),
          //         new Flexible(
          //           child: new TextField(
          //             onChanged: (text) {
          //               questionCtr.answerContent4 = text;
          //             },
          //             decoration: InputDecoration(labelText: 'Nhập đáp án 4'),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // // Nhập nội dung phần giải thích
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     TextFormField(
          //       onChanged: (text) {
          //         questionCtr.explain = text;
          //       },
          //       cursorColor: Colors.deepPurpleAccent,
          //       minLines: 2,
          //       keyboardType: TextInputType.multiline,
          //       maxLines: null,
          //       decoration:
          //           InputDecoration(labelText: 'Nhập nội dung phần giải thích'),
          //     )
          //   ],
          // ),

          // // Nhập nội dung cần gạch chân
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     TextFormField(
          //       onChanged: (text) {
          //         questionCtr.addUnderline(text);
          //       },
          //       cursorColor: Colors.deepPurpleAccent,
          //       minLines: 2,
          //       keyboardType: TextInputType.multiline,
          //       maxLines: null,
          //       decoration:
          //           InputDecoration(labelText: 'Nhập nội dung cần gạch chân'),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
