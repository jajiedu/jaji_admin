import 'package:flutter/material.dart';
import 'render/reading/form1/reading_add_form1_input.dart';

///thiết định page nhập câu hỏi tùy vào loai câu hỏi muốn nhập
class RouterFormInput extends StatelessWidget {
  RouterFormInput(this.formCode);
  final String formCode;

  @override
  Widget build(BuildContext context) {
    switch (formCode) {
      case '1':
        return ReadingAddForm1Input(); // đọc hiểu tổng hợp

      case '2':
        return ReadingAddForm1Input();

      default:
        return ReadingAddForm1Input();
    }
  }
}
