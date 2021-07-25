import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/components/render/reading/form1/reading_add_qs1.dart';

import 'reading_add_qs_widget.dart';

class ReadingAddQsOutputRouter extends StatelessWidget {
  int code;
  ReadingAddQsOutputRouter(this.code);
  @override
  Widget build(BuildContext context) {
    switch (code) {
      case 0:
        return ReadingAddQsWidget(
          indexOfQs: 0,
        );
      case 1:
        return ReadingAddQsWidget(
          indexOfQs: 1,
        );
      case 2:
        return ReadingAddQsWidget(
          indexOfQs: 2,
        );
      default:
        return ReadingAddQsWidget(
          indexOfQs: 0,
        );
    }
  }
}
