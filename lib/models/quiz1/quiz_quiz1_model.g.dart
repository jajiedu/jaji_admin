// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_quiz1_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModelQuiz1 _$QuizModelQuiz1FromJson(Map<String, dynamic> json) {
  return QuizModelQuiz1(
    id: json['id'] as String,
    questionNormal:
        (json['questionNormal'] as List).map((e) => e as String).toList(),
    questionFurigana: (json['questionFurigana'] as List<List<RubyTextData>>)
        .map((e) =>
            (e as List<RubyTextData>).map((e) => e as RubyTextData).toList())
        .toList(),
    questionTranslate:
        (json['questionTranslate'] as List).map((e) => e as String).toList(),
    listSubQuestion: (json['listSubQuestion'] as List)
        .map((e) => QsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuizModelQuiz1ToJson(QuizModelQuiz1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionNormal': instance.questionNormal,
      'questionFurigana': instance.questionFurigana
          ?.map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'questionTranslate': instance.questionTranslate,
      'listSubQuestion':
          instance.listSubQuestion?.map((e) => e.toJson()).toList(),
    };
