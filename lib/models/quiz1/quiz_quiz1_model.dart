import 'package:ruby_text/ruby_text/ruby_text.dart';
import 'qs_quiz1_model.dart';

class QuizModelQuiz1 {
  QuizModelQuiz1({
    this.id,
    this.questionNormal,
    this.questionFurigana,
    this.questionTranslate,
    this.listSubQuestion,
  });
  QuizModelQuiz1.fromJson(Map<String, Object?> json)
      : this(
          questionNormal: json['questionNormal']! as List<String>,
          questionFurigana:
              json['questionFurigana']! as List<List<RubyTextData>>,
          questionTranslate: json['questionTranslate']! as List<String>,
          listSubQuestion: json['listSubQuestion']! as List<QsModel>,
        );

  String? id = ''; // id của bài tập
  /// Đề bài(normal)
  List<String>? questionNormal = <String>[];

  /// Đề bài(furigana)
  List<List<RubyTextData>>? questionFurigana;

  /// Đề bài(translate)
  List<String>? questionTranslate;

  ///danh sách câu hỏi
  List<QsModel>? listSubQuestion;

  Map<String, Object?> toJson() {
    return {
      'questionNormal': questionNormal,
      'questionFurigana': questionFurigana,
      'questionTranslate': questionTranslate,
      'listQs': listSubQuestion,
    };
  }
}
