import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_ctrl.dart';
import 'components/router_form_input.dart';

class InputPage extends StatelessWidget {
  InputPage({
    Key? key,
  }) : super(key: key);
  final AddCtrl questionCtr = Get.put(AddCtrl());
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
                    //Chọn cấp độ câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: questionCtr.selectedLevel.value,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 16,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 1,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            questionCtr.changeLevel(newValue!);
                          },
                          items: questionCtr.level
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    //Chọn thể loại câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: questionCtr.selectedType.value,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 16,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 1,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            questionCtr.changeType(newValue!);
                            // setState(() {
                            //   questionCtr.selectedType = newValue;
                            // });
                          },
                          items: questionCtr.type
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    //Chọn thể loại con của câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: questionCtr.selectedSubType.value,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 16,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 1,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            questionCtr.changeSubType(newValue!);
                          },
                          items: questionCtr.subType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Gạch chân: u (u言葉(ことば)u)'),
              ],
            ),

            // thiết định page nhập câu hỏi tùy vào loai câu hỏi muốn nhập
            Obx(() => RouterFormInput(questionCtr.formCode.value)),
          ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return makeWidget(context);
  }
}
