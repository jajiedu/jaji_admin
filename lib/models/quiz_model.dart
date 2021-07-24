import 'qs_model.dart';
import 'qs_ruby_text_model.dart';

class QuizModel {
  QuizModel({
    this.id,
    this.questionNormal,
    this.questionFurigana,
    this.questionTranslate,
    this.listSubQuestion,
  });
  QuizModel.fromJson(Map<String, Object?> json)
      : this(
          questionNormal: json['questionNormal']! as List<String>,
          questionFurigana:
              json['questionFurigana']! as List<List<QsRubyTextModel>>,
          questionTranslate: json['questionTranslate']! as List<String>,
          listSubQuestion: json['listSubQuestion']! as List<QsModel>,
        );

  String? id = ''; // id của bài tập
  /// Đề bài(normal)
  List<String>? questionNormal = <String>[];

  /// Đề bài(furigana)
  List<List<QsRubyTextModel>>? questionFurigana;

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
