import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_ctrl.dart';
import 'components/router_form_input.dart';

/// trang để nhập input
class InputPage extends StatelessWidget {
  InputPage({
    Key? key,
  }) : super(key: key);
  final AddCtrl addCtrl = Get.put(AddCtrl());
  Widget makeWidget(context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    chooseLevelWidget(),
                    chooseTypeWidget(),
                    chooseSubTypeWidget()
                  ],
                ),
                Text('Gạch chân: u (u言葉(ことば)u)'),
              ],
            ),
            Obx(() => RouterFormInput(addCtrl.formCode.value)),
          ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }

  ///widget select box chọn cấp độ của câu hỏi
  Widget chooseLevelWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => DropdownButton<String>(
          dropdownColor: Colors.white,
          value: addCtrl.selectedLevel.value,
          icon: Icon(Icons.arrow_downward),
          iconSize: 16,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 1,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            addCtrl.changeLevel(newValue!);
          },
          items: addCtrl.level.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  ///widget select box chọn thể loại
  Widget chooseTypeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => DropdownButton<String>(
          dropdownColor: Colors.white,
          value: addCtrl.selectedType.value,
          icon: Icon(Icons.arrow_downward),
          iconSize: 16,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 1,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            addCtrl.changeType(newValue!);
          },
          items: addCtrl.type.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  ///widget select box chọn thể loại con
  Widget chooseSubTypeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => DropdownButton<String>(
          dropdownColor: Colors.white,
          value: addCtrl.selectedSubType.value,
          icon: Icon(Icons.arrow_downward),
          iconSize: 16,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 1,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            addCtrl.changeSubType(newValue!);
          },
          items: addCtrl.subType.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
