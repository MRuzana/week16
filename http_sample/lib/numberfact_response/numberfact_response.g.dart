// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numberfact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberfactResponse _$NumberfactResponseFromJson(Map<String, dynamic> json) =>
    NumberfactResponse(
      text: json['text'] as String?,
      number: json['number'] as num?,
      found: json['found'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NumberfactResponseToJson(NumberfactResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
      'found': instance.found,
      'type': instance.type,
    };
