import 'package:flutter/material.dart';
import 'package:ruby_text/ruby_text/ruby_text.dart';

class OutputPage extends StatelessWidget {
  OutputPage({
    Key? key,
    // it means we have to pass this
    //@required this.question,
  }) : super(key: key);
  Widget makeWidget(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('OUTPUT'),
          Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
