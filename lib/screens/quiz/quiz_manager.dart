import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';
import 'add/input_page.dart';
import 'add/output_page.dart';

/// trang quản lý câu hỏi:
/// thêm, sửa, xóa

class QuizManagerPage extends StatelessWidget {
  final String? title;
  QuizManagerPage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: SplitView(
        viewMode: SplitViewMode.Horizontal,
        indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Horizontal,
          isActive: true,
        ),
        children: [
          InputPage(),
          OutputPage(),
        ],
        // onWeightChanged: (w) => print("Horizon: $w"),
      ),
    );
  }
}
