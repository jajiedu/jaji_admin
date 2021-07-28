// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qs_quiz1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QsModel _$QsModelFromJson(Map<String, dynamic> json) {
  return QsModel(
    subQuestionNormal:
        (json['subQuestionNormal'] as List).map((e) => e as String).toList(),
    subQuestionFurigana: (json['subQuestionFurigana']
            as List<List<RubyTextData>>)
        .map((e) =>
            (e as List<RubyTextData>).map((e) => e as RubyTextData).toList())
        .toList(),
    explain: (json['explain'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$QsModelToJson(QsModel instance) => <String, dynamic>{
      'subQuestionNormal': instance.subQuestionNormal,
      'subQuestionFurigana': instance.subQuestionFurigana
          ?.map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'listSubQuestion':
          instance.listSubQuestion?.map((e) => e.toJson()).toList(),
      'explain': instance.explain,
    };
