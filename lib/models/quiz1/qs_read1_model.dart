import 'package:mutation_text/ruby_text/ruby_text.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qs_read1_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QsRead1Model {
  QsRead1Model({
    this.id,
    this.questionNormal,
    this.qsFurigana1,
    this.qsFurigana2,
    this.qsFurigana3,
    this.qsFurigana4,
    this.qsFurigana5,
    this.qsFurigana6,
    this.qsFurigana7,
    this.qsFurigana8,
    this.qsFurigana9,
    this.qsFurigana10,
    this.qsFurigana11,
    this.qsFurigana12,
    this.qsFurigana13,
    this.qsFurigana14,
    this.qsFurigana15,
    this.qsTranslate,
    this.subQsNormal1,
    this.subQsNormal2,
    this.subQsNormal3,
    this.subQsFurigana1,
    this.subQsFurigana2,
    this.subQsFurigana3,
    this.asNormal11,
    this.asNormal12,
    this.asNormal13,
    this.asNormal14,
    this.asNormal21,
    this.asNormal22,
    this.asNormal23,
    this.asNormal24,
    this.asNormal31,
    this.asNormal32,
    this.asNormal33,
    this.asNormal34,
    this.asFurigana11,
    this.asFurigana12,
    this.asFurigana13,
    this.asFurigana14,
    this.asFurigana21,
    this.asFurigana22,
    this.asFurigana23,
    this.asFurigana24,
    this.asFurigana31,
    this.asFurigana32,
    this.asFurigana33,
    this.asFurigana34,
  });

  String? id = ''; // id của bài tập
  /// Đề bài(normal)
  List<String>? questionNormal = <String>[];

  /// Đề bài(furigana) 1
  List<RubyTextData>? qsFurigana1;

  /// Đề bài(furigana) 2
  List<RubyTextData>? qsFurigana2;

  /// Đề bài(furigana) 3
  List<RubyTextData>? qsFurigana3;

  /// Đề bài(furigana) 4
  List<RubyTextData>? qsFurigana4;

  /// Đề bài(furigana) 5
  List<RubyTextData>? qsFurigana5;

  /// Đề bài(furigana) 6
  List<RubyTextData>? qsFurigana6;

  /// Đề bài(furigana) 7
  List<RubyTextData>? qsFurigana7;

  /// Đề bài(furigana) 8
  List<RubyTextData>? qsFurigana8;

  /// Đề bài(furigana) 9
  List<RubyTextData>? qsFurigana9;

  /// Đề bài(furigana) 10
  List<RubyTextData>? qsFurigana10;

  /// Đề bài(furigana) 11
  List<RubyTextData>? qsFurigana11;

  /// Đề bài(furigana) 12
  List<RubyTextData>? qsFurigana12;

  /// Đề bài(furigana) 13
  List<RubyTextData>? qsFurigana13;

  /// Đề bài(furigana) 14
  List<RubyTextData>? qsFurigana14;

  /// Đề bài(furigana) 15
  List<RubyTextData>? qsFurigana15;

  /// Đề bài(translate)
  List<String>? qsTranslate;

  ///danh sách câu hỏi() làm lại
  List<String>? subQsNormal1; // Câu hỏi (normal)1
  List<RubyTextData>? subQsFurigana1; //Câu hỏi (furigana) 1
  bool? isTrue1; // đúng hay không 1
  List<String>? explain1; // giải thích 1
  List<String>? asNormal11; //answer-normal11
  List<String>? asNormal12; //answer-normal11
  List<String>? asNormal13; //answer-normal11
  List<String>? asNormal14; //answer-normal11
  List<RubyTextData>? asFurigana11; //answer-furigana11
  List<RubyTextData>? asFurigana12; //answer-furigana12
  List<RubyTextData>? asFurigana13; //answer-furigana13
  List<RubyTextData>? asFurigana14; //answer-furigana14
  ///câu hỏi và đáp án 2
  List<String>? subQsNormal2; // Câu hỏi (normal)2
  List<RubyTextData>? subQsFurigana2; //Câu hỏi (furigana) 2
  bool? isTrue2; // đúng hay không 2
  List<String>? explain2; // giải thích 1
  List<String>? asNormal21; //answer-normal2
  List<String>? asNormal22; //answer-normal2
  List<String>? asNormal23; //answer-normal2
  List<String>? asNormal24; //answer-normal2
  List<RubyTextData>? asFurigana21; //answer-furigana21
  List<RubyTextData>? asFurigana22; //answer-furigana22
  List<RubyTextData>? asFurigana23; //answer-furigana23
  List<RubyTextData>? asFurigana24; //answer-furigana24
  ///câu hỏi và đáp án 3
  List<String>? subQsNormal3; // Câu hỏi (normal)3
  List<RubyTextData>? subQsFurigana3; //Câu hỏi (furigana) 3
  bool? isTrue3; // đúng hay không 2
  List<String>? explain3; // giải thích 1
  List<String>? asNormal31; //answer-normal2
  List<String>? asNormal32; //answer-normal2
  List<String>? asNormal33; //answer-normal2
  List<String>? asNormal34; //answer-normal2
  List<RubyTextData>? asFurigana31; //answer-furigana31
  List<RubyTextData>? asFurigana32; //answer-furigana32
  List<RubyTextData>? asFurigana33; //answer-furigana33
  List<RubyTextData>? asFurigana34; //answer-furigana34

  factory QsRead1Model.fromJson(Map<String, dynamic> json) =>
      _$QsRead1ModelFromJson(json);

  Map<String, dynamic> toJson() => _$QsRead1ModelToJson(this);
}
