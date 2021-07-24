import 'qs_ruby_text_model.dart';

class AsModel {
  AsModel({this.answerNormal, this.answerFurigana, this.isTrue});
  List<String>? answerNormal; //answer-normal
  List<List<QsRubyTextModel>>? answerFurigana; //answer-furigana
  bool? isTrue; // đúng hay không
}
