import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/questions/controller/question_controller.dart';

import 'add_form1.dart';
import 'add_form2.dart';

class FormAddQuestion extends StatefulWidget {
  @override
  _FormAddQuestionState createState() => _FormAddQuestionState();
}

class _FormAddQuestionState extends State<FormAddQuestion> {
  final QuestionController questionCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    switch (questionCtr.formCode) {
      case '1':
        return AddForm1();

      case '2':
        return AddForm2();

      default:
        return AddForm1();
    }
  }
}
