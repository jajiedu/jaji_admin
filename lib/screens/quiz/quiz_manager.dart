import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

import 'add/input_page.dart';
import 'add/output_page.dart';

class QuizManagerPage extends StatefulWidget {
  QuizManagerPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _QuizManagerPageState createState() => _QuizManagerPageState();
}

class _QuizManagerPageState extends State<QuizManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
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
        onWeightChanged: (w) => print("Horizon: $w"),
      ),
    );
  }
}
