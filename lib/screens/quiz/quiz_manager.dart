import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

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
          Container(
            child: Center(child: Text("View1")),
            color: Colors.red,
          ),
          Container(
            child: Center(child: Text("View2")),
            color: Colors.blue,
          ),
          Container(
            child: Center(child: Text("View3")),
            color: Colors.green,
          ),
        ],
        onWeightChanged: (w) => print("Horizon: $w"),
      ),
    );
  }
}
