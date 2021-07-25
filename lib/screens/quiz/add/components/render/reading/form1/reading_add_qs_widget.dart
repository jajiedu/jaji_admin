import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reading_add_form1_ctrl.dart';

class ReadingAddQsWidget extends StatelessWidget {
  ReadingAddQsWidget({Key? key, this.indexOfQs}) : super(key: key);

  int? indexOfQs;

  ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.find();
  Widget makeWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // câu hỏi 1
        Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
            readingAddForm1Ctrl
                .quizModel.value.listSubQuestion![indexOfQs!].subQuestionNormal,
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .subQuestionFurigana)),
        // Đáp án 1
        Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![0].answerNormal,
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![0].answerFurigana)),
        // Đáp án 2
        Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![1].answerNormal,
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![1].answerFurigana)),
        // Đáp án 3
        Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![2].answerNormal,
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![2].answerFurigana)),
        // Đáp án 4
        Obx(() => readingAddForm1Ctrl.getTextRubyWidgets(
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![3].answerNormal,
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                .listSubQuestion![3].answerFurigana)),
        Obx(() => Text(readingAddForm1Ctrl.getAs(readingAddForm1Ctrl
            .quizModel.value.listSubQuestion![0].listSubQuestion!))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
