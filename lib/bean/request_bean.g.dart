// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscribeRequestImpl _$$TranscribeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscribeRequestImpl(
      audio: json['audio'] as String,
      isTranslate: json['isTranslate'] as bool? ?? false,
      threads: (json['threads'] as num?)?.toInt() ?? 8,
      isVerbose: json['isVerbose'] as bool? ?? false,
      language: json['language'] as String? ?? 'auto',
      isSpecialTokens: json['isSpecialTokens'] as bool? ?? false,
      isNoTimestamps: json['isNoTimestamps'] as bool? ?? false,
      nProcessors: (json['nProcessors'] as num?)?.toInt() ?? 1,
      splitOnWord: json['splitOnWord'] as bool? ?? false,
      noFallback: json['noFallback'] as bool? ?? false,
      diarize: json['diarize'] as bool? ?? false,
      speedUp: json['speedUp'] as bool? ?? false,
    );

Map<String, dynamic> _$$TranscribeRequestImplToJson(
        _$TranscribeRequestImpl instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'isTranslate': instance.isTranslate,
      'threads': instance.threads,
      'isVerbose': instance.isVerbose,
      'language': instance.language,
      'isSpecialTokens': instance.isSpecialTokens,
      'isNoTimestamps': instance.isNoTimestamps,
      'nProcessors': instance.nProcessors,
      'splitOnWord': instance.splitOnWord,
      'noFallback': instance.noFallback,
      'diarize': instance.diarize,
      'speedUp': instance.speedUp,
    };

_$TranscribeRequestDtoImpl _$$TranscribeRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscribeRequestDtoImpl(
      audio: json['audio'] as String,
      model: json['model'] as String,
      isTranslate: json['is_translate'] as bool,
      threads: (json['threads'] as num).toInt(),
      isVerbose: json['is_verbose'] as bool,
      language: json['language'] as String,
      isSpecialTokens: json['is_special_tokens'] as bool,
      isNoTimestamps: json['is_no_timestamps'] as bool,
      nProcessors: (json['n_processors'] as num).toInt(),
      splitOnWord: json['split_on_word'] as bool,
      noFallback: json['no_fallback'] as bool,
      diarize: json['diarize'] as bool,
      speedUp: json['speed_up'] as bool,
    );

Map<String, dynamic> _$$TranscribeRequestDtoImplToJson(
        _$TranscribeRequestDtoImpl instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'model': instance.model,
      'is_translate': instance.isTranslate,
      'threads': instance.threads,
      'is_verbose': instance.isVerbose,
      'language': instance.language,
      'is_special_tokens': instance.isSpecialTokens,
      'is_no_timestamps': instance.isNoTimestamps,
      'n_processors': instance.nProcessors,
      'split_on_word': instance.splitOnWord,
      'no_fallback': instance.noFallback,
      'diarize': instance.diarize,
      'speed_up': instance.speedUp,
    };
