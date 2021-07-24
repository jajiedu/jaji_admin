import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_form1.dart';
import 'add_form2.dart';
import 'render/reading/form1/reading_add_form1.dart';

// class RouterFormInput extends StatefulWidget {
//   RouterFormInput(this.formCode);
//   late String formCode;
//   @override
//   _RouterFormInputState createState() => _RouterFormInputState();
// }

class RouterFormInput extends StatelessWidget {
  // final QuestionController questionCtr = Get.find();
  RouterFormInput(this.formCode);
  String formCode;

  @override
  Widget build(BuildContext context) {
    switch (formCode) {
      case '1':
        return ReadingAddForm1(); // đọc hiểu tổng hợp

      case '2':
        return AddForm2();

      default:
        return AddForm1();
    }
  }
}
