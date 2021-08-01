import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/screens/quiz/add/add_ctrl.dart';
import 'components/router_form_output.dart';

class OutputPage extends StatelessWidget {
  OutputPage({
    Key? key,
  }) : super(key: key);
  final AddCtrl addCtr = Get.put(AddCtrl());
  Widget makeWidget(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('OUTPUT'),
          Container(
            padding: EdgeInsets.all(8),
            child: Obx(() => RouterFormOutput(addCtr.formCode.value)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
