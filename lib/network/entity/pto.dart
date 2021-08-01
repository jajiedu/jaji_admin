import 'package:json_annotation/json_annotation.dart';
part 'pto.g.dart';

@JsonSerializable()
class Pto {
  List<String>? msgs;
  String? action;

  Pto({this.msgs, this.action});
  factory Pto.fromJson(Map<String, dynamic> json) => _$PtoFromJson(json);

  Map<String, dynamic> toJson() => _$PtoToJson(this);
}
