// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      appId: json['app_id'] as String,
      sentence: json['sentence'] as String,
      outputType: json['output_type'] as String? ?? 'hiragana',
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'app_id': instance.appId,
      'sentence': instance.sentence,
      'output_type': instance.outputType,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      converted: json['converted'] as String,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'converted': instance.converted,
    };
