import 'package:flutter/material.dart';
import 'package:jaji_admin/screens/quiz/add/components/render/reading/form1/reading_add_input_adapter.dart';

class ReadingAddQsInputRouter extends StatelessWidget {
  final String code;
  ReadingAddQsInputRouter(this.code);
  @override
  Widget build(BuildContext context) {
    switch (code) {
      case '1':
        return ReadingAddInputAdapter(
          code: '1',
          indexOfPage: 0,
          indexOfTextCtrl: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        );
      case '2':
        return ReadingAddInputAdapter(
          code: '2',
          indexOfPage: 1,
          indexOfTextCtrl: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
        );
      case '3':
        return ReadingAddInputAdapter(
          code: '3',
          indexOfPage: 2,
          indexOfTextCtrl: [22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32],
        );
      default:
        return ReadingAddInputAdapter(
          code: '1',
          indexOfPage: 0,
          indexOfTextCtrl: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        );
    }
  }
}
