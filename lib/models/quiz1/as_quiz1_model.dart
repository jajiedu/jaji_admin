import 'package:ruby_text/ruby_text/ruby_text.dart';

class AsModel {
  AsModel({this.answerNormal, this.answerFurigana, this.isTrue});
  List<String>? answerNormal; //answer-normal
  List<List<RubyTextData>>? answerFurigana; //answer-furigana
  bool? isTrue; // đúng hay không
}
