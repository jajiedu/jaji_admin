import 'package:ruby_text/ruby_text/ruby_text.dart';
part 'as_quiz1_model.g.dart';

class AsModel {
  AsModel({this.answerNormal, this.answerFurigana, this.isTrue});

  List<String>? answerNormal; //answer-normal
  List<List<RubyTextData>>? answerFurigana; //answer-furigana
  bool? isTrue; // đúng hay không

  factory AsModel.fromJson(Map<String, dynamic> json) =>
      _$AsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AsModelToJson(this);
}
