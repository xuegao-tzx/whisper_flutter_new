// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhisperTranscribeResponseImpl _$$WhisperTranscribeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WhisperTranscribeResponseImpl(
      type: json['@type'] as String,
      text: json['text'] as String,
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) =>
              WhisperTranscribeSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WhisperTranscribeResponseImplToJson(
        _$WhisperTranscribeResponseImpl instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'text': instance.text,
      'segments': instance.segments,
    };

_$WhisperTranscribeSegmentImpl _$$WhisperTranscribeSegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$WhisperTranscribeSegmentImpl(
      fromTs: WhisperTranscribeSegment._durationFromInt(
          (json['from_ts'] as num).toInt()),
      toTs: WhisperTranscribeSegment._durationFromInt(
          (json['to_ts'] as num).toInt()),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$WhisperTranscribeSegmentImplToJson(
        _$WhisperTranscribeSegmentImpl instance) =>
    <String, dynamic>{
      'from_ts': instance.fromTs.inMicroseconds,
      'to_ts': instance.toTs.inMicroseconds,
      'text': instance.text,
    };

_$WhisperVersionResponseImpl _$$WhisperVersionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WhisperVersionResponseImpl(
      type: json['@type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$WhisperVersionResponseImplToJson(
        _$WhisperVersionResponseImpl instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'message': instance.message,
    };
