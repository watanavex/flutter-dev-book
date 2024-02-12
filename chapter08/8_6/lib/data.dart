import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Request {
  const Request({
    required this.appId,
    required this.sentence,
    this.outputType = 'hiragana',
  });
  final String appId;
  final String sentence;
  final String outputType;
  Map<String, Object?> toJson() => _$RequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Response {
  const Response({
    required this.converted,
  });
  final String converted;
  factory Response.fromJson(Map<String, Object?> json) =>
      _$ResponseFromJson(json);
}
