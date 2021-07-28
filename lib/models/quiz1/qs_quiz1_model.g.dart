// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qs_quiz1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QsModel _$QsModelFromJson(Map<String, dynamic> json) {
  return QsModel(
    subQuestionNormal: (json['subQuestionNormal'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    subQuestionFurigana: (json['subQuestionFurigana'] as List<dynamic>?)
        ?.map((e) => (e as List<dynamic>)
            .map((e) => RubyTextData.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList(),
    listSubQuestion: (json['listSubQuestion'] as List<dynamic>?)
        ?.map((e) => AsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    explain:
        (json['explain'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$QsModelToJson(QsModel instance) => <String, dynamic>{
      'subQuestionNormal': instance.subQuestionNormal,
      'subQuestionFurigana': instance.subQuestionFurigana,
      'listSubQuestion': instance.listSubQuestion,
      'explain': instance.explain,
    };
