/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */
import "package:freezed_annotation/freezed_annotation.dart";

part "response_bean.freezed.dart";
part "response_bean.g.dart";

@unfreezed
class WhisperTranscribeResponse with _$WhisperTranscribeResponse {
  factory WhisperTranscribeResponse({
    @JsonKey(name: "@type") required String type,
    required String text,
    @JsonKey(name: "segments")
    required List<WhisperTranscribeSegment>? segments,
  }) = _WhisperTranscribeResponse;

  factory WhisperTranscribeResponse.fromJson(Map<String, dynamic> json) =>
      _$WhisperTranscribeResponseFromJson(json);
}

@unfreezed
class WhisperTranscribeSegment with _$WhisperTranscribeSegment {
  ///
  factory WhisperTranscribeSegment({
    @JsonKey(
      name: "from_ts",
      fromJson: WhisperTranscribeSegment._durationFromInt,
    )
    required Duration fromTs,
    @JsonKey(
      name: "to_ts",
      fromJson: WhisperTranscribeSegment._durationFromInt,
    )
    required Duration toTs,
    required String text,
  }) = _WhisperTranscribeSegment;

  /// Parse [json] to WhisperTranscribeSegment
  factory WhisperTranscribeSegment.fromJson(Map<String, dynamic> json) =>
      _$WhisperTranscribeSegmentFromJson(json);

  static Duration _durationFromInt(int timestamp) {
    return Duration(
      milliseconds: timestamp * 10,
    );
  }
}

@unfreezed
class WhisperVersionResponse with _$WhisperVersionResponse {
  factory WhisperVersionResponse({
    @JsonKey(name: "@type") required String type,
    required String message,
  }) = _WhisperVersionResponse;

  factory WhisperVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$WhisperVersionResponseFromJson(json);
}
