import 'package:flutter/material.dart';
import 'reading_add_output_adapter.dart';

class ReadingAddQsOutputRouter extends StatelessWidget {
  final int code;
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
