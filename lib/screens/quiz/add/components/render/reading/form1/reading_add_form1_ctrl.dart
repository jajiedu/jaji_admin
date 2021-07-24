import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/models/qs_ruby_text_model.dart';
import 'package:jaji_admin/models/quiz_model.dart';
import 'package:ruby_text/ruby_text/ruby_text.dart';
import '/../utils/string_extension.dart';

//Thể loại đọc hiểu ass
class ReadingAddForm1Ctrl extends GetxController {
  // Lưu câu hỏi
  Rx<QuizModel> quizModel = new QuizModel().obs;

  @override
  void onInit() {
    quizModel.value.questionNormal = <String>[];
    quizModel.value.questionFurigana = <List<QsRubyTextModel>>[];
    super.onInit();
  }

  ///up date Đề bài(normal)
  void updateQuestionNormal(String text) {
    quizModel.value.questionNormal = <String>[];
    List<String> p = text.split('\\n');
    for (var i = 0; i < p.length; i++) {
      quizModel.update((val) {
        quizModel.value.questionNormal!.add(p[i]);
      });
    }
  }

  ///up date Đề bài(furigana)
  void updateQuestionFurigana(String text) {
    quizModel.value.questionFurigana = <List<QsRubyTextModel>>[];
    List<String> p = text.split('\\n');
    for (var i = 0; i < p.length; i++) {
      quizModel.update((val) {
        quizModel.value.questionFurigana!.add(convertTextToRuby(p[i]));
      });
    }
  }

  /// create ruby data  text
  List<RubyTextData>? createRubyData(List<QsRubyTextModel> listInput) {
    List<RubyTextData> outPut = [];
    listInput.forEach((element) {
      RubyTextData? data = RubyTextData('');

      data.text = element.text;
      data.ruby = element.rubyText;
      outPut.add(data);
    });
    return outPut;
  }

  Widget getTextWidgets(
      List<String>? texts, List<List<QsRubyTextModel>>? questionFurigana) {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < texts!.length; i++) {
      List<RubyTextData>? outPut = [];
      outPut = createRubyData(questionFurigana![i]);
      list.add(new RubyText(texts[i], outPut));
    }
    return new Column(children: list);
  }

  /// chuyển đổi sang sạng ruby text
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
}
