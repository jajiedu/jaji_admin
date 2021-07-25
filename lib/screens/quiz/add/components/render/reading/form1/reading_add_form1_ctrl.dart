import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaji_admin/models/quiz1/as_quiz1_model.dart';
import 'package:jaji_admin/models/quiz1/qs_quiz1_model.dart';
import 'package:jaji_admin/models/quiz1/quiz_quiz1_model.dart';
import 'package:jaji_admin/services/quiz_services.dart';
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
    //khởi tạo text controller lưu giá trị của input
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

  /// gender view khi có ruby text
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
        list.add(RubyText(texts[i], questionFurigana[i]));
      }
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: list);
    }
  }

  /// gender view khi không có ruby text
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
      //var isBracket = false;
      var isUnderlined = false;
      int startIndex = 0;
      // biến trung gian
      RubyTextData qsRubyTextModel = RubyTextData('');
      List<String> characters = p.split('');
      // chạy vòng lặp tới khi gặp chữ kanji
      for (int i = 0; i < characters.length; i++) {
        // khi là chữ kanji thì check xem phía trước có phải dấu ngoặc không
        if (characters[i].isKanji()) {
          // nếu phía trước là dấu ngoặc
          if (characters[i + 1] == '(') {
            //lưu lại giá trị của text từ vị trí start tới điểm trước dấu ngoặc
            qsRubyTextModel.text = p.substring(startIndex, i + 1);
            //nếu thành phần đó đc gạch chân thì thiết định style
            if (isUnderlined) {
              qsRubyTextModel.style =
                  TextStyle(decoration: TextDecoration.underline);
            }
            //sau khi lưu giá trị thì thiết định lại điểm start
            startIndex = i + 1;
            // bật cờ kanji
            isKanji = true;
          }
        } //khi là dấu ngoặc thì check xem cờ kanji có đang được bật không
        // nếu cờ đang được bật thi dấu ngoặc đó là dấu ngoặc ở xử lý trên
        // khi đó tăng điểm start lên 1 để bỏ qua dấu ngoặc
        else if (characters[i] == '(' && isKanji) {
          startIndex++;
        } //khi là dấu ngoặc đóng thì check xem cờ kanji có đang được bật không
        //nếu đang được bật thì đâu là dấu đóng ngoặc của nội dung furigane
        // khi ấy lưu giá trị furigana từ điểm start tới điểm trước dấu ngoặc
        // đóng, sau đó tăng điểm start lên 1 để bỏ qua dấu ngoặc
        else if (characters[i] == ')' && isKanji) {
          // lưu giá trị từ vị trí start tới trước dấu ngoặc
          qsRubyTextModel.ruby = p.substring(startIndex, i);
          //nếu thành phần đó đc gạch chân thì thiết định style
          if (isUnderlined) {
            qsRubyTextModel.style =
                TextStyle(decoration: TextDecoration.underline);
          }
          // tăng điểm start
          startIndex = i + 1;
          // tắt cờ kanji
          isKanji = false;
          //lưu ruby data vào mảng
          rubyText.add(qsRubyTextModel);
          // khởi tạo lại biến trung gian
          qsRubyTextModel = RubyTextData('');
        } // khi gặp kí tự 'u' thì bật cờ gạch chân lên
        // phần này dùng để thiết định style cho chữ
        else {
          if (characters[i] == 'u') {
            // bật tắt cờ gạch chân
            isUnderlined = !isUnderlined;
            // tăng điểm start lên 1 để bỏ qua chữ u
            startIndex++;
          } else {
            //nếu kí tự không thuộc phạm vi chữ kanji và các kí tự đánh dấu
            //thì là kí tự không furigane nên sẽ lưu giá trị
            if (isKanji == false) {
              // lưu kí tự
              qsRubyTextModel.text = characters[i];
              // tăng điểm start lên 1
              startIndex = i + 1;
              //nếu thành phần đó đc gạch chân thì thiết định style
              if (isUnderlined) {
                qsRubyTextModel.style =
                    TextStyle(decoration: TextDecoration.underline);
              }
              // lưu giá trị vào mảng
              rubyText.add(qsRubyTextModel);
              // khởi tạo lại biến trung gian
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

  void saveQsAs() {
    QuizServices().addDict(quizModel.value);
  }
}
