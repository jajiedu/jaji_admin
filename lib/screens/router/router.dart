import 'package:flutter/material.dart';
import 'package:jaji_admin/screens/quiz/quiz_manager.dart';

import '../main/main_screen.dart';

class RouterPage extends StatefulWidget {
  RouterPage({Key? key, this.name}) : super(key: key);

  final String? name;

  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  @override
  Widget build(BuildContext context) {
    switch (widget.name) {
      case 'home':
        return QuizManagerPage(
          title: 'Quiz Manager',
        );

      case 'quiz':
        return QuizManagerPage(
          title: 'Quiz Manager',
        );

      default:
        return QuizManagerPage();
    }
  }
}
