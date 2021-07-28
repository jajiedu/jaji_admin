// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_quiz1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsModel _$AsModelFromJson(Map<String, dynamic> json) {
  return AsModel(
    answerNormal:
        (json['answerNormal'] as List).map((e) => e as String).toList(),
    answerFurigana: (json['answerFurigana'] as List<List<RubyTextData>>)
        .map((e) =>
            (e as List<RubyTextData>).map((e) => e as RubyTextData).toList())
        .toList(),
    isTrue: json['isTrue'] as bool,
  );
}

Map<String, dynamic> _$AsModelToJson(AsModel instance) => <String, dynamic>{
      'answerNormal': instance.answerNormal,
      'answerFurigana': instance.answerFurigana
          ?.map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'isTrue': instance.isTrue,
    };
