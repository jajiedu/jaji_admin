import 'package:flutter/material.dart';
import 'render/reading/form1/reading_add_form1_output.dart';

class RouterFormOutput extends StatelessWidget {
  RouterFormOutput(this.formCode);
  final String formCode;

  @override
  Widget build(BuildContext context) {
    switch (formCode) {
      case '1':
        return ReadingAddForm1Output(); // đọc hiểu tổng hợp

      case '2':
        return ReadingAddForm1Output();

      default:
        return ReadingAddForm1Output();
    }
  }
}
