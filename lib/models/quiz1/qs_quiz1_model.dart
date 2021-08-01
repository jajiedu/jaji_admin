import 'package:json_annotation/json_annotation.dart';
import 'package:mutation_text/ruby_text/src/ruby_text_data.dart';
import 'as_quiz1_model.dart';
part 'qs_quiz1_model.g.dart';

@JsonSerializable()
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

  factory QsModel.fromJson(Map<String, dynamic> json) =>
      _$QsModelFromJson(json);
  Map<String, dynamic> toJson() => _$QsModelToJson(this);
}
