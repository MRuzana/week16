import 'package:json_annotation/json_annotation.dart';

part 'numberfact_response.g.dart';

@JsonSerializable()
class NumberfactResponse {

  @JsonKey(name: 'text')
  String? text;

   @JsonKey(name: 'number')
  num? number;

   @JsonKey(name: 'found')
  bool? found;

   @JsonKey(name: 'type')
  String? type;

  NumberfactResponse({this.text, this.number, this.found, this.type});

  factory NumberfactResponse.fromJson(Map<String, dynamic> json) {
    return _$NumberfactResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberfactResponseToJson(this);
}
