/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */
import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:whisper_flutter_new/bean/whisper_dto.dart";

part "request_bean.freezed.dart";
part "request_bean.g.dart";

@unfreezed
class TranscribeRequest with _$TranscribeRequest {
  factory TranscribeRequest({
    required String audio,
    @Default(false) bool isTranslate,
    @Default(6) int threads,
    @Default(false) bool isVerbose,
    @Default("auto") String language,
    @Default(false) bool isSpecialTokens,
    @Default(false) bool isNoTimestamps,
    @Default(1) int nProcessors,
    @Default(false) bool splitOnWord,
    @Default(false) bool noFallback,
    @Default(false) bool diarize,
    @Default(false) bool speedUp,
  }) = _TranscribeRequest;
  factory TranscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$TranscribeRequestFromJson(json);
}

@freezed
class TranscribeRequestDto
    with _$TranscribeRequestDto
    implements WhisperRequestDto {
  const factory TranscribeRequestDto({
    required String audio,
    required String model,
    @JsonKey(name: "is_translate") required bool isTranslate,
    required int threads,
    @JsonKey(name: "is_verbose") required bool isVerbose,
    required String language,
    @JsonKey(name: "is_special_tokens") required bool isSpecialTokens,
    @JsonKey(name: "is_no_timestamps") required bool isNoTimestamps,
    @JsonKey(name: "n_processors") required int nProcessors,
    @JsonKey(name: "split_on_word") required bool splitOnWord,
    @JsonKey(name: "no_fallback") required bool noFallback,
    required bool diarize,
    @JsonKey(name: "speed_up") required bool speedUp,
  }) = _TranscribeRequestDto;

  /// Convert [request] to TranscribeRequestDto with specified [modelPath]
  factory TranscribeRequestDto.fromTranscribeRequest(
    TranscribeRequest request,
    String modelPath,
  ) {
    return TranscribeRequestDto(
      audio: request.audio,
      model: modelPath,
      isTranslate: request.isTranslate,
      threads: request.threads,
      isVerbose: request.isVerbose,
      language: request.language,
      isSpecialTokens: request.isSpecialTokens,
      isNoTimestamps: request.isNoTimestamps,
      nProcessors: request.nProcessors,
      splitOnWord: request.splitOnWord,
      noFallback: request.noFallback,
      diarize: request.diarize,
      speedUp: request.speedUp,
    );
  }
  const TranscribeRequestDto._();

  /// Create request json
  factory TranscribeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TranscribeRequestDtoFromJson(json);

  @override
  String get specialType => "getTextFromWavFile";

  @override
  String toRequestString() {
    return json.encode({
      "@type": specialType,
      ...toJson(),
    });
  }
}

@freezed
class VersionRequest with _$VersionRequest implements WhisperRequestDto {
  const factory VersionRequest() = _VersionRequest;
  const VersionRequest._();

  @override
  String get specialType => "getVersion";

  @override
  String toRequestString() {
    return json.encode({
      "@type": specialType,
    });
  }
}
