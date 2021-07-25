import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/components/render/reading/form1/reading_add_qs1.dart';

import 'reading_add_qs2.dart';
import 'reading_add_qs3.dart';

// class RouterFormInput extends StatefulWidget {
//   RouterFormInput(this.formCode);
//   late String formCode;
//   @override
//   _RouterFormInputState createState() => _RouterFormInputState();
// }

class ReadingAddQsRouter extends StatelessWidget {
  String code;
  ReadingAddQsRouter(this.code);
  @override
  Widget build(BuildContext context) {
    switch (code) {
      case '1':
        return ReadingAddQs1(
          code: '1',
          indexOfPage: 0,
          indexOfTextCtrl: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        );
      case '2':
        return ReadingAddQs2(code: '2');
      case '3':
        return ReadingAddQs3(code: '3');
      default:
        return ReadingAddQs1(
          code: '1',
          indexOfPage: 0,
          indexOfTextCtrl: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        );
    }
  }
}
