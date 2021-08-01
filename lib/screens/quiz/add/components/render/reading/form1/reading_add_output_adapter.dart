import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutation_text/mutation_text/mutation_text.dart';
import 'reading_add_form1_ctrl.dart';

/// adapter hiển thị câu hỏi và đáp án
class ReadingAddQsWidget extends StatelessWidget {
  final int? indexOfQs;
  ReadingAddQsWidget({Key? key, this.indexOfQs}) : super(key: key);
  final ReadingAddForm1Ctrl readingAddForm1Ctrl = Get.find();
  Widget makeWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // câu hỏi 1
        Text('Câu hỏi ${indexOfQs! + 1}: '),
        Obx(() => MutationText(
            readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                        .subQuestionNormal ==
                    null
                ? ''
                : readingAddForm1Ctrl.quizModel.value
                    .listSubQuestion![indexOfQs!].subQuestionNormal,
            furiganaText: readingAddForm1Ctrl.quizModel.value
                        .listSubQuestion![indexOfQs!].subQuestionFurigana ==
                    null
                ? ''
                : readingAddForm1Ctrl.quizModel.value
                    .listSubQuestion![indexOfQs!].subQuestionFurigana)),
        // Đáp án 1
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Đáp án 1: '),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Obx(() => MutationText(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                          .listSubQuestion![0].answerNormal ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![0]
                      .answerNormal,
              furiganaText: readingAddForm1Ctrl
                          .quizModel
                          .value
                          .listSubQuestion![indexOfQs!]
                          .listSubQuestion![0]
                          .answerFurigana ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![0]
                      .answerFurigana)),
        ),
        // Đáp án 2
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Đáp án 2: '),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Obx(() => MutationText(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                          .listSubQuestion![1].answerNormal ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![1]
                      .answerNormal,
              furiganaText: readingAddForm1Ctrl
                          .quizModel
                          .value
                          .listSubQuestion![indexOfQs!]
                          .listSubQuestion![1]
                          .answerFurigana ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![1]
                      .answerFurigana)),
        ),
        // Đáp án 3
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Đáp án 3: '),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Obx(() => MutationText(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                          .listSubQuestion![2].answerNormal ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![2]
                      .answerNormal,
              furiganaText: readingAddForm1Ctrl
                          .quizModel
                          .value
                          .listSubQuestion![indexOfQs!]
                          .listSubQuestion![2]
                          .answerFurigana ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![2]
                      .answerFurigana)),
        ),
        // Đáp án 4
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Đáp án 4: '),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Obx(() => MutationText(
              readingAddForm1Ctrl.quizModel.value.listSubQuestion![indexOfQs!]
                          .listSubQuestion![3].answerNormal ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![3]
                      .answerNormal,
              furiganaText: readingAddForm1Ctrl
                          .quizModel
                          .value
                          .listSubQuestion![indexOfQs!]
                          .listSubQuestion![3]
                          .answerFurigana ==
                      null
                  ? ''
                  : readingAddForm1Ctrl
                      .quizModel
                      .value
                      .listSubQuestion![indexOfQs!]
                      .listSubQuestion![3]
                      .answerFurigana)),
        ),
        // Hiển thị đáp án
        Obx(() => Text(readingAddForm1Ctrl.getAs(readingAddForm1Ctrl
            .quizModel.value.listSubQuestion![indexOfQs!].listSubQuestion!))),
        // GIải thích
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text('Giải thích: '),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Obx(() => MutationText(readingAddForm1Ctrl
                        .quizModel.value.listSubQuestion![indexOfQs!].explain ==
                    null
                ? ''
                : readingAddForm1Ctrl
                    .quizModel.value.listSubQuestion![indexOfQs!].explain))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
