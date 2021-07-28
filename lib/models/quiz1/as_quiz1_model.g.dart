// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'as_quiz1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsModel _$AsModelFromJson(Map<String, dynamic> json) {
  return AsModel(
    answerNormal: (json['answerNormal'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    answerFurigana: (json['answerFurigana'] as List<dynamic>?)
        ?.map((e) => (e as List<dynamic>)
            .map((e) => RubyTextData.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList(),
    isTrue: json['isTrue'] as bool?,
  );
}

Map<String, dynamic> _$AsModelToJson(AsModel instance) => <String, dynamic>{
      'answerNormal': instance.answerNormal,
      'answerFurigana': instance.answerFurigana,
      'isTrue': instance.isTrue,
    };
