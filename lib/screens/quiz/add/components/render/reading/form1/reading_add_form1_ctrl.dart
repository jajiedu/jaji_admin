import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/models/as_model.dart';
import 'package:jaji_admin/models/qs_model.dart';
import 'package:jaji_admin/models/qs_ruby_text_model.dart';
import 'package:jaji_admin/models/quiz_model.dart';
import 'package:ruby_text/ruby_text/ruby_text.dart';
import '/../utils/string_extension.dart';

//Thể loại đọc hiểu ass
class ReadingAddForm1Ctrl extends GetxController
    with SingleGetTickerProviderMixin {
  // Lưu câu hỏi
  Rx<QuizModel> quizModel = new QuizModel().obs;
  late TabController tabQuestionController;
  RxString code = ''.obs;
  RxInt radioValueQs1 = 0.obs;
  List<TextEditingController> textCtrls = [];
  @override
  void onInit() {
    quizModel.value.questionNormal = <String>[];
    quizModel.value.questionFurigana = <List<QsRubyTextModel>>[];
    quizModel.value.questionTranslate = <String>[];
    quizModel.value.listSubQuestion = <QsModel>[];
    for (var i = 0; i < 3; i++) {
      quizModel.value.listSubQuestion!.add(QsModel());
      quizModel.value.listSubQuestion![i].listSubQuestion = <AsModel>[];
      for (var j = 0; j < 4; j++) {
        quizModel.value.listSubQuestion![i].listSubQuestion!.add(AsModel());
        quizModel.value.listSubQuestion![i].listSubQuestion![j].answerFurigana =
            <List<QsRubyTextModel>>[];
      }
    }
    //khởi tạo
    for (var i = 0; i < 30; i++) {
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
    quizModel.value.questionFurigana = <List<QsRubyTextModel>>[];
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
        <List<QsRubyTextModel>>[];
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
        .answerFurigana = <List<QsRubyTextModel>>[];
    quizModel.update((val) {
      for (var i = 0; i < p.length; i++) {
        quizModel.value.listSubQuestion![indexQ].listSubQuestion![indexA]
            .answerFurigana!
            .add(convertTextToRuby(p[i]));
      }
    });
  }

  // update đáp án đúng
  void updateValueRadio1(dynamic v, int index) {
    radioValueQs1.update((val) {
      radioValueQs1.value = v;
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
    AsModel asModel = AsModel();
    String as = '';
    if (listAs[0].isTrue == null) {
      return '';
    } else {
      for (var i = 0; i < listAs.length; i++) {
        if (listAs[i].isTrue!) {
          asModel = listAs[i];
          as = (i + 1).toString();
        }
      }
      return 'Đáp án đúng ' + as;
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

  Widget getTextRubyWidgets(
      List<String>? texts, List<List<QsRubyTextModel>>? questionFurigana) {
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
        List<RubyTextData>? outPut = [];
        outPut = createRubyData(questionFurigana[i]);
        list.add(RubyText(texts[i], outPut));
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

  void updateCode(String c) {
    code.update((val) {
      code.value = c;
    });
  }
}
