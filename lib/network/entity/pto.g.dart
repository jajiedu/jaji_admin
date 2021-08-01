// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pto _$PtoFromJson(Map<String, dynamic> json) {
  return Pto(
    msgs: (json['msgs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    action: json['action'] as String?,
  );
}

Map<String, dynamic> _$PtoToJson(Pto instance) => <String, dynamic>{
      'msgs': instance.msgs,
      'action': instance.action,
    };
