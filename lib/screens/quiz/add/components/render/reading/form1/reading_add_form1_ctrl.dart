import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jaji_admin/models/qs_ruby_text_model.dart';
import 'package:jaji_admin/models/quiz1/as_quiz1_model.dart';
import 'package:jaji_admin/models/quiz1/qs_quiz1_model.dart';
import 'package:jaji_admin/models/quiz1/quiz_quiz1_model.dart';
import 'package:ruby_text/ruby_text/ruby_text.dart';
import '/../utils/string_extension.dart';

//Thể loại đọc hiểu ass
class ReadingAddForm1Ctrl extends GetxController
    with SingleGetTickerProviderMixin {
  // Lưu câu hỏi
  Rx<QuizModelQuiz1> quizModel = new QuizModelQuiz1().obs;
  late TabController tabQuestionController;
  RxString code = ''.obs;
  List<RxInt>? radioValueQs;
  RxInt codeQsAs = 0.obs;
  List<TextEditingController> textCtrls = [];
  @override
  void onInit() {
    quizModel.value.questionNormal = <String>[];
    quizModel.value.questionFurigana = <List<RubyTextData>>[];
    quizModel.value.questionTranslate = <String>[];
    quizModel.value.listSubQuestion = <QsModel>[];
    radioValueQs = <RxInt>[]; //radio
    for (var i = 0; i < 3; i++) {
      quizModel.value.listSubQuestion!.add(QsModel());
      quizModel.value.listSubQuestion![i].listSubQuestion = <AsModel>[];
      radioValueQs!.add(0.obs); //radio
      for (var j = 0; j < 4; j++) {
        quizModel.value.listSubQuestion![i].listSubQuestion!.add(AsModel());
        quizModel.value.listSubQuestion![i].listSubQuestion![j].answerFurigana =
            <List<RubyTextData>>[];
      }
    }
    //khởi tạo
    for (var i = 0; i < 33; i++) {
      textCtrls.add(TextEditingController());
    }

    super.onInit();
  }

  ///update Đề bài(normal)
  void updateQuestionNormal(String text) {
    quizModel.value.questionNormal = <String>[];
    List<String> p = text.split('\\n');
    for (var i = 0; i < p.length; i++) {
      quizModel.update((val) {
        quizModel.value.questionNormal!.add(p[i]);
      });
    }
  }

  ///update Đề bài(furigana)
  void updateQuestionFurigana(String text) {
    quizModel.value.questionFurigana = <List<RubyTextData>>[];
    List<String> p = text.split('\\n');
    for (var i = 0; i < p.length; i++) {
      quizModel.update((val) {
        quizModel.value.questionFurigana!.add(convertTextToRuby(p[i]));
      });
    }
  }

  ///update Đề bài(translate)
  void updateQuestionTranslate(String text) {
    quizModel.value.questionTranslate = <String>[];
    List<String> p = text.split('\\n');
    for (var i = 0; i < p.length; i++) {
      quizModel.update((val) {
        quizModel.value.questionTranslate!.add((p[i]));
      });
    }
  }

  ///Câu hỏi (normal)
  void updatesubQuestionNormal(String text, int indexQ, int indexA) {
    List<String> p = text.split('\\n');
    quizModel.update((val) {
      quizModel.value.listSubQuestion![indexQ].subQuestionNormal = p;
    });
    update();
  }

  ///câu hỏi (furigana)
  void updatesubQuestionFurigana(String text, int indexQ, int indexA) {
    List<String> p = text.split('\\n');
    quizModel.value.listSubQuestion![indexQ].subQuestionFurigana =
        <List<RubyTextData>>[];
    quizModel.update((val) {
      for (var i = 0; i < p.length; i++) {
        quizModel.value.listSubQuestion![indexQ].subQuestionFurigana!
            .add(convertTextToRuby(p[i]));
      }
    });
    update();
  }

  ///Đáp án (normal)
  void updateAnswerNormal(String text, int indexQ, int indexA) {
    List<String> p = text.split('\\n');
    quizModel.update((val) {
      quizModel.value.listSubQuestion![indexQ].listSubQuestion![indexA]
          .answerNormal = p;
    });
  }

  ///Đáp án (furigana)
  void updateAnswerFurigana(String text, int indexQ, int indexA) {
    List<String> p = text.split('\\n');
    quizModel.value.listSubQuestion![indexQ].listSubQuestion![indexA]
        .answerFurigana = <List<RubyTextData>>[];
    quizModel.update((val) {
      for (var i = 0; i < p.length; i++) {
        quizModel.value.listSubQuestion![indexQ].listSubQuestion![indexA]
            .answerFurigana!
            .add(convertTextToRuby(p[i]));
      }
    });
  }

  // update đáp án đúng
  void updateValueRadio(dynamic v, int index) {
    radioValueQs![index].update((val) {
      radioValueQs![index].value = v;
    });
    for (var i = 0;
        i < quizModel.value.listSubQuestion![index].listSubQuestion!.length;
        i++) {
      quizModel.value.listSubQuestion![index].listSubQuestion![i].isTrue =
          false;
    }
    quizModel.update((val) {
      quizModel.value.listSubQuestion![index].listSubQuestion![v - 1].isTrue =
          true;
    });
  }

  ///Giải thích
  void updateExplain(String text, int index) {
    List<String> p = text.split('\\n');
    quizModel.update((val) {
      quizModel.value.listSubQuestion![index].explain = p;
    });
  }

  /// lấy đáp án đúng
  String getAs(List<AsModel> listAs) {
    String as = '';
    if (listAs[0].isTrue == null) {
      return '';
    } else {
      for (var i = 0; i < listAs.length; i++) {
        if (listAs[i].isTrue!) {
          as = (i + 1).toString();
        }
      }
      return 'Đáp án đúng ' + as;
    }
  }

  /// create ruby data  text
  // List<RubyTextData>? createRubyData(List<RubyTextData> listInput) {
  //   List<RubyTextData> outPut = [];
  //   listInput.forEach((element) {
  //     RubyTextData? data = RubyTextData('');
  //     data.text = element.text;
  //     data.ruby = element.rubyText;
  //     data.style = TextStyle(decoration: TextDecoration.none);
  //     if (element.isUnderlined != null && element.isUnderlined!) {
  //       data.style = TextStyle(decoration: TextDecoration.underline);
  //     }
  //     outPut.add(data);
  //   });
  //   return outPut;
  // }

  Widget getTextRubyWidgets(
      List<String>? texts, List<List<RubyTextData>>? questionFurigana) {
    List<Widget> list = <Widget>[];

    if (texts == null || questionFurigana == null) {
      RubyTextData data = RubyTextData('');
      list.add(RubyText('', [data]));
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list);
    } else {
      for (var i = 0; i < questionFurigana.length; i++) {
        // List<RubyTextData>? outPut = [];
        // outPut = createRubyData(questionFurigana[i]);
        list.add(RubyText(texts[i], questionFurigana[i]));
      }
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list);
    }
  }

  Widget getTextStringWidgets(List<String>? texts) {
    List<Widget> list = <Widget>[];
    if (texts == null) {
      list.add(Text(''));
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list);
    } else {
      for (var i = 0; i < texts.length; i++) {
        list.add(Text(texts[i]));
      }
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list);
    }
  }

  /// chuyển đổi sang sạng ruby text
  List<RubyTextData> convertTextToRuby(String text) {
    List<String> listP = text.split('/n');
    List<RubyTextData> rubyText = <RubyTextData>[];
    for (var p in listP) {
      var isKanji = false;
      var isBracket = false;
      var isUnderlined = false;
      int startIndex = 0;
      RubyTextData qsRubyTextModel = RubyTextData('');
      List<String> characters = p.split('');
      for (int i = 0; i < characters.length; i++) {
        if (characters[i].isKanji()) {
          if (characters[i + 1] == '(') {
            qsRubyTextModel.text = p.substring(startIndex, i + 1);
            if (isUnderlined) {
              qsRubyTextModel.style =
                  TextStyle(decoration: TextDecoration.underline);
            }
            startIndex = i + 1;
            isKanji = true;
          }
        } else if (characters[i] == '(' && isKanji) {
          startIndex++;
        } else if (characters[i] == ')' && isKanji) {
          qsRubyTextModel.ruby = p.substring(startIndex, i);
          if (isUnderlined) {
            qsRubyTextModel.style =
                TextStyle(decoration: TextDecoration.underline);
          }
          startIndex = i + 1;
          isKanji = false;
          // print(qsRubyTextModel.text! +
          //     "⇒" +
          //     qsRubyTextModel.ruby! +
          //     qsRubyTextModel.style!.decoration.toString());
          rubyText.add(qsRubyTextModel);
          qsRubyTextModel = RubyTextData('');
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
                qsRubyTextModel.style =
                    TextStyle(decoration: TextDecoration.underline);
              }
              // print(qsRubyTextModel.text! + "⇒" + qsRubyTextModel.rubyText!);
              // print(qsRubyTextModel.text! +
              //     "⇒" +
              //     qsRubyTextModel.ruby! +
              //     qsRubyTextModel.style!.decoration.toString());
              rubyText.add(qsRubyTextModel);
              qsRubyTextModel = RubyTextData('');
            }
          }
        }
      }
    }
    return rubyText;
  }

  void updateCode(String c) {
    code.update((val) {
      code.value = c;
    });
  }

  void updateCodeQsAs(int c) {
    code.update((val) {
      codeQsAs.value = c;
    });
  }
}
