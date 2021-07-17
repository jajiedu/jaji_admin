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
          questionNormal: json['questionNormal']! as String,
          questionFurigana: json['questionFurigana']! as List<QsRubyTextModel>,
          questionTranslate: json['questionTranslate']! as String,
          listSubQuestion: json['listSubQuestion']! as List<QsModel>,
        );

  String? id = ''; // id của bài tập
  String? questionNormal; // Đề bài(normal)
  List<QsRubyTextModel>? questionFurigana; // Đề bài(furigana)
  String? questionTranslate; // Đề bài(translate)
  List<QsModel>? listSubQuestion; //danh sách câu hỏi

  Map<String, Object?> toJson() {
    return {
      'questionNormal': questionNormal,
      'questionFurigana': questionFurigana,
      'questionTranslate': questionTranslate,
      'listQs': listSubQuestion,
    };
  }
}
