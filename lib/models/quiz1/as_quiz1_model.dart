import 'package:ruby_text/ruby_text/ruby_text.dart';

class AsModel {
  AsModel({this.answerNormal, this.answerFurigana, this.isTrue});

  AsModel.fromJson(Map<String, Object?> json)
      : this(
          answerNormal: json['answerNormal']! as List<String>,
          answerFurigana: json['answerFurigana']! as List<List<RubyTextData>>,
          isTrue: json['isTrue']! as bool,
        );
  List<String>? answerNormal; //answer-normal
  List<List<RubyTextData>>? answerFurigana; //answer-furigana
  bool? isTrue; // đúng hay không
  Map<String, Object?> toJson() {
    return {
      'answerNormal': answerNormal,
      'answerFurigana': answerFurigana,
      'isTrue': isTrue,
    };
  }
}
