import 'package:flutter/material.dart';
import 'add_form1.dart';
import 'add_form2.dart';
import 'render/reading/form1/reading_add_form1_output.dart';

// class RouterFormOutput extends StatefulWidget {
//   RouterFormOutput(this.formCode);
//   late String formCode;
//   @override
//   _RouterFormOutputState createState() => _RouterFormOutputState();
// }

class RouterFormOutput extends StatelessWidget {
  // final QuestionController questionCtr = Get.find();
  RouterFormOutput(this.formCode);
  String formCode;

  @override
  Widget build(BuildContext context) {
    switch (formCode) {
      case '1':
        return ReadingAddForm1Output(); // đọc hiểu tổng hợp

      case '2':
        return AddForm2();

      default:
        return AddForm1();
    }
  }
}
