import 'package:json_annotation/json_annotation.dart';
import 'package:mutation_text/ruby_text/ruby_text.dart';
part 'as_quiz1_model.g.dart';

@JsonSerializable()
class AsModel {
  AsModel({this.answerNormal, this.answerFurigana, this.isTrue});

  String? answerNormal; //answer-normal
  String? answerFurigana; //answer-furigana
  bool? isTrue; // đúng hay không

  factory AsModel.fromJson(Map<String, dynamic> json) =>
      _$AsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AsModelToJson(this);
}
