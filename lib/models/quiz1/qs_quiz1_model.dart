import 'package:ruby_text/ruby_text/ruby_text.dart';
import 'as_quiz1_model.dart';

class QsModel {
  QsModel(
      {this.subQuestionNormal,
      this.subQuestionFurigana,
      this.listSubQuestion,
      this.explain});

  List<String>? subQuestionNormal; // Câu hỏi (normal)
  List<List<RubyTextData>>? subQuestionFurigana; //Câu hỏi (furigana)
  List<AsModel>? listSubQuestion; // danh sách câu các đáp án
  List<String>? explain;
}
