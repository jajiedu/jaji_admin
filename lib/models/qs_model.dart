import 'as_model.dart';
import 'qs_ruby_text_model.dart';

class QsModel {
  QsModel(
      {this.subQuestionNormal,
      this.subQuestionFurigana,
      this.listSubQuestion,
      this.explain});

  String? subQuestionNormal; // Câu hỏi (normal)
  List<QsRubyTextModel>? subQuestionFurigana; //Câu hỏi (furigana)
  List<AsModel>? listSubQuestion; // danh sách câu các đáp án
  String? explain;
}
