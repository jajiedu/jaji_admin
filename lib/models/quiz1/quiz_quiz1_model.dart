import 'package:ruby_text/ruby_text/ruby_text.dart';
import 'qs_quiz1_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quiz_quiz1_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModelQuiz1 {
  QuizModelQuiz1({
    this.id,
    this.questionNormal,
    this.questionFurigana,
    this.questionTranslate,
    this.listSubQuestion,
  });

  String? id = ''; // id của bài tập
  /// Đề bài(normal)
  List<String>? questionNormal = <String>[];

  /// Đề bài(furigana)
  List<List<RubyTextData>>? questionFurigana;

  /// Đề bài(translate)
  List<String>? questionTranslate;

  ///danh sách câu hỏi
  List<QsModel>? listSubQuestion;

  factory QuizModelQuiz1.fromJson(Map<String, dynamic> json) =>
      _$QuizModelQuiz1FromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelQuiz1ToJson(this);
}
