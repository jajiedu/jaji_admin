import 'package:ruby_text/ruby_text/ruby_text.dart';
import 'as_quiz1_model.dart';

class QsModel {
  QsModel(
      {this.subQuestionNormal,
      this.subQuestionFurigana,
      this.listSubQuestion,
      this.explain});
  QsModel.fromJson(Map<String, Object?> json)
      : this(
          subQuestionNormal: json['subQuestionNormal']! as List<String>,
          subQuestionFurigana:
              json['subQuestionFurigana']! as List<List<RubyTextData>>,
          listSubQuestion: json['listSubQuestion']! as List<AsModel>,
          explain: json['explain']! as List<String>,
        );
  List<String>? subQuestionNormal; // Câu hỏi (normal)
  List<List<RubyTextData>>? subQuestionFurigana; //Câu hỏi (furigana)
  List<AsModel>? listSubQuestion; // danh sách câu các đáp án
  List<String>? explain;

  Map<String, Object?> toJson() {
    return {
      'subQuestionNormal': subQuestionNormal,
      'subQuestionFurigana': subQuestionFurigana,
      'listSubQuestion': listSubQuestion,
      'explain': explain,
    };
  }
}
