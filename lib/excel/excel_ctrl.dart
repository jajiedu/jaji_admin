import 'dart:convert';
import 'dart:html';

import 'package:excel/excel.dart' show Data, Excel;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jaji_admin/models/as_model.dart';
import 'package:jaji_admin/models/qs_model.dart';
import 'package:jaji_admin/models/qs_ruby_text_model.dart';
import 'package:jaji_admin/models/quiz_model.dart';
import 'package:jaji_admin/models/rice_text_model.dart';
import '../../utils/string_extension.dart';

// We use get package for our state management

class ExcelCtrl extends GetxController with SingleGetTickerProviderMixin {
  // called immediately after the widget is allocated memory
  RxString? nameFile = ''.obs;
  RxInt? total = 0.obs;
  Excel? excel;
  var charSpecial = [
    '１',
    '２',
    '３',
    '（',
    '）',
    '４',
    '５',
    '６',
    '７',
    '８',
    '９',
    '０',
    '％'
  ];
  @override
  void onInit() {
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {}

  // Future<void> readFileExcel() async {
  //   ByteData ?data = await rootBundle.load("assets/n2_vocabunary1.xlsx");
  //   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   var excel = Excel.decodeBytes(bytes);
  //   for (var table in excel.tables.keys) {
  //     print(table); //sheet Name
  //     print(excel.tables[table]!.maxCols);
  //     print(excel.tables[table]!.maxRows);
  //     for (var row in excel.tables[table]!.rows) {
  //       print("$row");
  //     }
  //   }
  // }

  Future<void> exportExcelToFirebase() async {
    if (excel != null) {
      for (var table in excel!.tables.keys) {
        print(table); //sheet Name
        print(excel!.tables[table]!.maxCols);
        print(excel!.tables[table]!.row);
        QuizModel quizModel = new QuizModel();
        var dataTable = excel;
        // xóa dòng đầu tiên
        //  dataTable.tables[table]!.removeRow(0);
        for (var row in dataTable!.tables[table]!.rows) {
          print("$row");
          //Đề bài(normal)
          if (row[0] != null) {
            Data? dataA = row[0];
            quizModel.questionNormal = <String>[];
            List<String> p = dataA!.value.split('\\n');
            for (var i = 0; i < p.length; i++) {
              quizModel.questionNormal!.add(p[i]);
            }
          }
          //Đề bài(furigana)
          if (row[1] != null) {
            Data? dataB = row[1];
            quizModel.questionFurigana = <List<QsRubyTextModel>>[];
            List<String> p = dataB!.value.split('\\n');
            for (var i = 0; i < p.length; i++) {
              quizModel.questionFurigana!.add(convertTextToRuby(p[i]));
            }
          }
          //Đề bài(translate)
          if (row[2] != null) {
            Data? dataC = row[2];
            quizModel.questionTranslate = <String>[];
            List<String> p = dataC!.value.split('\\n');
            for (var i = 0; i < p.length; i++) {
              quizModel.questionTranslate!.add(p[i]);
            }
          }
          // thiết định câu hỏi 1
          QsModel qsModel1 = new QsModel();
          AsModel asModel11 = new AsModel();
          AsModel asModel12 = new AsModel();
          AsModel asModel13 = new AsModel();
          AsModel asModel14 = new AsModel();
          if (row[3] != null) {
            Data? dataD = row[3]; //Câu hỏi 1(normal)
            qsModel1.subQuestionNormal = dataD!.value;
          }

          if (row[4] != null) {
            Data? dataE = row[4]; //Câu hỏi 1(furigana)
            qsModel1.subQuestionFurigana = convertTextToRuby(dataE!.value);
          }
          // thiết định đáp án 1
          if (row[5] != null) {
            Data? dataF = row[5]; //Câu hỏi 1(answer1-normal)
            asModel11.answerNormal = dataF!.value;
          }

          if (row[6] != null) {
            Data? dataG = row[6]; //Câu hỏi 1(answer1-furigana)
            asModel11.answerFurigana = convertTextToRuby(dataG!.value);
          }

          if (row[7] != null) {
            Data? dataH = row[7]; //Câu hỏi 1(answer1-isTrue)
            asModel11.isTrue = false;
            if (dataH!.value == '1') {
              asModel11.isTrue = true;
            }
          }
          // thiết định câu hỏi 2
          if (row[8] != null) {
            Data? dataI = row[8]; //Câu hỏi 1(answer2-normal)
            asModel12.answerNormal = dataI!.value;
          }

          if (row[9] != null) {
            Data? dataJ = row[9]; //Câu hỏi 1(answer2-furigana)
            asModel12.answerFurigana = convertTextToRuby(dataJ!.value);
          }

          if (row[10] != null) {
            Data? dataK = row[10]; //Câu hỏi 1(answer2-isTrue)
            asModel12.isTrue = false;
            if (dataK!.value == '1') {
              asModel12.isTrue = true;
            }
          }

          if (row[11] != null) {
            Data? dataL = row[11]; //Câu hỏi 1(answer3-normal)
            asModel13.answerNormal = dataL!.value;
          }

          if (row[12] != null) {
            Data? dataM = row[12]; //Câu hỏi 1(answer3-furigana)
            asModel13.answerFurigana = convertTextToRuby(dataM!.value);
          }

          if (row[13] != null) {
            Data? dataN = row[13]; //Câu hỏi 1(answer3-isTrue)
            asModel13.isTrue = false;
            if (dataN!.value == '1') {
              asModel13.isTrue = true;
            }
          }

          if (row[14] != null) {
            Data? dataO = row[14]; //Câu hỏi 1(answer4-normal)
            asModel14.answerNormal = dataO!.value;
          }

          if (row[15] != null) {
            Data? dataP = row[15]; //Câu hỏi 1(answer4-furigana)
            asModel14.answerFurigana = convertTextToRuby(dataP!.value);
          }

          if (row[16] != null) {
            Data? dataQ = row[16]; //Câu hỏi 1(answer4-isTrue)
            asModel14.isTrue = false;
            if (dataQ!.value == '1') {
              asModel14.isTrue = true;
            }
          }

          if (row[17] != null) {
            Data? dataR = row[17]; //Câu hỏi 1(explain)
            qsModel1.explain = dataR!.value;
          }
          qsModel1.listSubQuestion = <AsModel>[];
          qsModel1.listSubQuestion!.add(asModel11);
          qsModel1.listSubQuestion!.add(asModel12);
          qsModel1.listSubQuestion!.add(asModel13);
          qsModel1.listSubQuestion!.add(asModel14);
          // thiết định câu hỏi 2
          QsModel qsModel2 = new QsModel();
          AsModel asModel21 = new AsModel();
          AsModel asModel22 = new AsModel();
          AsModel asModel23 = new AsModel();
          AsModel asModel24 = new AsModel();
          if (row[18] != null) {
            Data? dataS = row[18]; //câu hỏi 2(normal)
            qsModel2.subQuestionNormal = dataS!.value;
          }

          if (row[19] != null) {
            Data? dataT = row[19]; //câu hỏi 2(furigana)
            qsModel2.subQuestionFurigana = convertTextToRuby(dataT!.value);
          }
          // thiết định đáp án 1
          if (row[20] != null) {
            Data? dataU = row[20]; //câu hỏi 2(answer1-normal)
            asModel21.answerNormal = dataU!.value;
          }

          if (row[21] != null) {
            Data? dataV = row[21]; //câu hỏi 2(answer1-furigana)
            asModel21.answerFurigana = convertTextToRuby(dataV!.value);
          }

          if (row[22] != null) {
            Data? dataH = row[22]; //câu hỏi 2(answer1-isTrue)
            asModel21.isTrue = false;
            if (dataH!.value == '1') {
              asModel21.isTrue = true;
            }
          }
          // thiết định câu hỏi 2
          if (row[23] != null) {
            Data? dataI = row[23]; //câu hỏi 2(answer2-normal)
            asModel22.answerNormal = dataI!.value;
          }

          if (row[24] != null) {
            Data? dataJ = row[24]; //câu hỏi 2(answer2-furigana)
            asModel22.answerFurigana = convertTextToRuby(dataJ!.value);
          }

          if (row[25] != null) {
            Data? dataK = row[25]; //câu hỏi 2(answer2-isTrue)
            asModel22.isTrue = false;
            if (dataK!.value == '1') {
              asModel22.isTrue = true;
            }
          }

          if (row[26] != null) {
            Data? dataL = row[26]; //câu hỏi 2(answer3-normal)
            asModel23.answerNormal = dataL!.value;
          }

          if (row[27] != null) {
            Data? dataM = row[27]; //câu hỏi 2(answer3-furigana)
            asModel23.answerFurigana = convertTextToRuby(dataM!.value);
          }

          if (row[28] != null) {
            Data? dataN = row[28]; //câu hỏi 2(answer3-isTrue)
            asModel23.isTrue = false;
            if (dataN!.value == '1') {
              asModel23.isTrue = true;
            }
          }

          if (row[29] != null) {
            Data? dataO = row[29]; //câu hỏi 2(answer4-normal)
            asModel24.answerNormal = dataO!.value;
          }

          if (row[30] != null) {
            Data? dataP = row[30]; //câu hỏi 2(answer4-furigana)
            asModel24.answerFurigana = convertTextToRuby(dataP!.value);
          }

          if (row[31] != null) {
            Data? dataQ = row[31]; //câu hỏi 2(answer4-isTrue)
            asModel24.isTrue = false;
            if (dataQ!.value == '1') {
              asModel24.isTrue = true;
            }
          }

          if (row[32] != null) {
            Data? dataR = row[32]; //câu hỏi 2(explain)
            qsModel2.explain = dataR!.value;
          }
          qsModel2.listSubQuestion = <AsModel>[];
          qsModel2.listSubQuestion!.add(asModel21);
          qsModel2.listSubQuestion!.add(asModel22);
          qsModel2.listSubQuestion!.add(asModel23);
          qsModel2.listSubQuestion!.add(asModel24);

          // thiết định câu hỏi 3
          QsModel qsModel3 = new QsModel();
          AsModel asModel31 = new AsModel();
          AsModel asModel32 = new AsModel();
          AsModel asModel33 = new AsModel();
          AsModel asModel34 = new AsModel();
          if (row[33] != null) {
            Data? dataS = row[33]; //câu hỏi 3(normal)
            qsModel3.subQuestionNormal = dataS!.value;
          }

          if (row[34] != null) {
            Data? dataT = row[34]; //câu hỏi 3(furigana)
            qsModel3.subQuestionFurigana = convertTextToRuby(dataT!.value);
          }
          // thiết định đáp án 1
          if (row[35] != null) {
            Data? dataU = row[35]; //câu hỏi 3(answer1-normal)
            asModel31.answerNormal = dataU!.value;
          }

          if (row[36] != null) {
            Data? dataV = row[36]; //câu hỏi 3(answer1-furigana)
            asModel31.answerFurigana = convertTextToRuby(dataV!.value);
          }

          if (row[37] != null) {
            Data? dataH = row[37]; //câu hỏi 3(answer1-isTrue)
            asModel31.isTrue = false;
            if (dataH!.value == '1') {
              asModel31.isTrue = true;
            }
          }
          // thiết định câu hỏi 3
          if (row[38] != null) {
            Data? dataI = row[38]; //câu hỏi 3(answer2-normal)
            asModel32.answerNormal = dataI!.value;
          }

          if (row[39] != null) {
            Data? dataJ = row[39]; //câu hỏi 3(answer2-furigana)
            asModel32.answerFurigana = convertTextToRuby(dataJ!.value);
          }

          if (row[40] != null) {
            Data? dataK = row[40]; //câu hỏi 3(answer2-isTrue)
            asModel32.isTrue = false;
            if (dataK!.value == '1') {
              asModel32.isTrue = true;
            }
          }

          if (row[41] != null) {
            Data? dataL = row[41]; //câu hỏi 3(answer3-normal)
            asModel33.answerNormal = dataL!.value;
          }

          if (row[42] != null) {
            Data? dataM = row[42]; //câu hỏi 3(answer3-furigana)
            asModel33.answerFurigana = convertTextToRuby(dataM!.value);
          }

          if (row[43] != null) {
            Data? dataN = row[43]; //câu hỏi 3(answer3-isTrue)
            asModel33.isTrue = false;
            if (dataN!.value == '1') {
              asModel33.isTrue = true;
            }
          }

          if (row[44] != null) {
            Data? dataO = row[44]; //câu hỏi 3(answer4-normal)
            asModel34.answerNormal = dataO!.value;
          }

          if (row[45] != null) {
            Data? dataP = row[45]; //câu hỏi 3(answer4-furigana)
            asModel34.answerFurigana = convertTextToRuby(dataP!.value);
          }

          if (row[46] != null) {
            Data? dataQ = row[46]; //câu hỏi 3(answer4-isTrue)
            asModel34.isTrue = false;
            if (dataQ!.value == '1') {
              asModel34.isTrue = true;
            }
          }

          if (row[47] != null) {
            Data? dataR = row[47]; //câu hỏi 3(explain)
            qsModel3.explain = dataR!.value;
          }
          qsModel3.listSubQuestion = <AsModel>[];
          qsModel3.listSubQuestion!.add(asModel31);
          qsModel3.listSubQuestion!.add(asModel32);
          qsModel3.listSubQuestion!.add(asModel33);
          qsModel3.listSubQuestion!.add(asModel34);
          // thiết định câu hỏi 4
          QsModel qsModel4 = new QsModel();
          AsModel asModel41 = new AsModel();
          AsModel asModel42 = new AsModel();
          AsModel asModel43 = new AsModel();
          AsModel asModel44 = new AsModel();
          if (row[48] != null) {
            Data? dataS = row[48]; //câu hỏi 4(normal)
            qsModel4.subQuestionNormal = dataS!.value;
          }

          if (row[49] != null) {
            Data? dataT = row[49]; //câu hỏi 4(furigana)
            qsModel4.subQuestionFurigana = convertTextToRuby(dataT!.value);
          }
          // thiết định đáp án 1
          if (row[50] != null) {
            Data? dataU = row[50]; //câu hỏi 4(answer1-normal)
            asModel41.answerNormal = dataU!.value;
          }

          if (row[51] != null) {
            Data? dataV = row[51]; //câu hỏi 4(answer1-furigana)
            asModel41.answerFurigana = convertTextToRuby(dataV!.value);
          }

          if (row[52] != null) {
            Data? dataH = row[52]; //câu hỏi 4(answer1-isTrue)
            asModel41.isTrue = false;
            if (dataH!.value == '1') {
              asModel41.isTrue = true;
            }
          }
          // thiết định câu hỏi 4
          if (row[53] != null) {
            Data? dataI = row[53]; //câu hỏi 4(answer2-normal)
            asModel42.answerNormal = dataI!.value;
          }

          if (row[54] != null) {
            Data? dataJ = row[54]; //câu hỏi 4(answer2-furigana)
            asModel42.answerFurigana = convertTextToRuby(dataJ!.value);
          }

          if (row[55] != null) {
            Data? dataK = row[55]; //câu hỏi 4(answer2-isTrue)
            asModel42.isTrue = false;
            if (dataK!.value == '1') {
              asModel42.isTrue = true;
            }
          }

          if (row[56] != null) {
            Data? dataL = row[56]; //câu hỏi 4(answer3-normal)
            asModel43.answerNormal = dataL!.value;
          }

          if (row[57] != null) {
            Data? dataM = row[57]; //câu hỏi 4(answer3-furigana)
            asModel43.answerFurigana = convertTextToRuby(dataM!.value);
          }

          if (row[58] != null) {
            Data? dataN = row[58]; //câu hỏi 4(answer3-isTrue)
            asModel43.isTrue = false;
            if (dataN!.value == '1') {
              asModel43.isTrue = true;
            }
          }

          if (row[59] != null) {
            Data? dataO = row[59]; //câu hỏi 4(answer4-normal)
            asModel44.answerNormal = dataO!.value;
          }

          if (row[60] != null) {
            Data? dataP = row[60]; //câu hỏi 4(answer4-furigana)
            asModel44.answerFurigana = convertTextToRuby(dataP!.value);
          }

          if (row[61] != null) {
            Data? dataQ = row[61]; //câu hỏi 4(answer4-isTrue)
            asModel44.isTrue = false;
            if (dataQ!.value == '1') {
              asModel44.isTrue = true;
            }
          }

          if (row[62] != null) {
            Data? dataR = row[62]; //câu hỏi 4(explain)
            qsModel4.explain = dataR!.value;
          }
          qsModel4.listSubQuestion = <AsModel>[];
          qsModel4.listSubQuestion!.add(asModel41);
          qsModel4.listSubQuestion!.add(asModel42);
          qsModel4.listSubQuestion!.add(asModel43);
          qsModel4.listSubQuestion!.add(asModel44);
          // thiết định câu hỏi
          quizModel.listSubQuestion = <QsModel>[];
          quizModel.listSubQuestion!.add(qsModel1);
          quizModel.listSubQuestion!.add(qsModel2);
          quizModel.listSubQuestion!.add(qsModel3);
          quizModel.listSubQuestion!.add(qsModel4);
          //
          print(quizModel.questionFurigana.toString());
        }
      }
    } else {
      // User canceled the picker
    }
  }

  List<QsRubyTextModel> convertTextToRuby(String text) {
    List<String> listP = text.split('/n');
    List<QsRubyTextModel> rubyText = <QsRubyTextModel>[];
    for (var p in listP) {
      var isKanji = false;
      var isBracket = false;
      var isUnderlined = false;
      int startIndex = 0;
      QsRubyTextModel qsRubyTextModel = QsRubyTextModel();
      List<String> characters = p.split('');
      for (int i = 0; i < characters.length; i++) {
        if (characters[i].isKanji()) {
          if (characters[i + 1] == '(') {
            qsRubyTextModel.text = p.substring(startIndex, i + 1);
            if (isUnderlined) {
              qsRubyTextModel.isUnderlined = true;
            }
            startIndex = i + 1;
            isKanji = true;
          }
        } else if (characters[i] == '(' && isKanji) {
          startIndex++;
        } else if (characters[i] == ')' && isKanji) {
          qsRubyTextModel.rubyText = p.substring(startIndex, i);
          if (isUnderlined) {
            qsRubyTextModel.isUnderlined = true;
          }
          startIndex = i + 1;
          isKanji = false;
          print(qsRubyTextModel.text! +
              "⇒" +
              qsRubyTextModel.rubyText! +
              qsRubyTextModel.isUnderlined.toString());
          rubyText.add(qsRubyTextModel);
          qsRubyTextModel = QsRubyTextModel();
        } else {
          if (characters[i] == 'u') {
            isUnderlined = !isUnderlined;
            startIndex++;
          } else {
            if (isKanji == false) {
              //print(p.substring(startIndex, i));
              qsRubyTextModel.text = characters[i];
              startIndex = i + 1;
              if (isUnderlined) {
                qsRubyTextModel.isUnderlined = true;
              }
              // print(qsRubyTextModel.text! + "⇒" + qsRubyTextModel.rubyText!);
              print(qsRubyTextModel.text! +
                  "⇒" +
                  qsRubyTextModel.isUnderlined.toString());
              rubyText.add(qsRubyTextModel);
              qsRubyTextModel = QsRubyTextModel();
            }
          }
        }
      }
    }
    return rubyText;
  }

//   bool isKanjiCheck(String character) {
// // 3000-303F : punctuation
// // 3040-309F : hiragana
// // 30A0-30FF : katakana
// // FF00-FFEF : Full-width roman + half-width katakana
// // 4E00-9FAF : Common and uncommon kanji
//     bool isKanji = false;
//     RegExp regExp = new RegExp(
//       r'[u4E00-u9FAF]',
//       caseSensitive: false,
//       multiLine: false,
//     );
//     if (regExp.hasMatch(character)) {
//       isKanji = true;
//     }
//     return isKanji;
//   }

  Future<void> pickerFileExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      //excel =  Excel();
      excel = Excel.decodeBytes(result.files[0].bytes!);
      for (var table in excel!.tables.keys) {
        print(table); //sheet Name
        print(excel!.tables[table]!.maxCols);
        print(excel!.tables[table]!.maxRows);
        nameFile!.update((val) {
          nameFile!.value = result.files[0].name;
        });
        total!.update((val) {
          total!.value = excel!.tables[table]!.maxRows;
        });
        update();
      }
    } else {
      // User canceled the picker
    }
  }
}
