// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_bean.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WhisperTranscribeResponse _$WhisperTranscribeResponseFromJson(
    Map<String, dynamic> json) {
  return _WhisperTranscribeResponse.fromJson(json);
}

/// @nodoc
mixin _$WhisperTranscribeResponse {
  @JsonKey(name: '@type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  set type(String value) => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  set text(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'segments')
  List<WhisperTranscribeSegment>? get segments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'segments')
  set segments(List<WhisperTranscribeSegment>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhisperTranscribeResponseCopyWith<WhisperTranscribeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhisperTranscribeResponseCopyWith<$Res> {
  factory $WhisperTranscribeResponseCopyWith(WhisperTranscribeResponse value,
          $Res Function(WhisperTranscribeResponse) then) =
      _$WhisperTranscribeResponseCopyWithImpl<$Res, WhisperTranscribeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '@type') String type,
      String text,
      @JsonKey(name: 'segments') List<WhisperTranscribeSegment>? segments});
}

/// @nodoc
class _$WhisperTranscribeResponseCopyWithImpl<$Res,
        $Val extends WhisperTranscribeResponse>
    implements $WhisperTranscribeResponseCopyWith<$Res> {
  _$WhisperTranscribeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? segments = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      segments: freezed == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<WhisperTranscribeSegment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhisperTranscribeResponseImplCopyWith<$Res>
    implements $WhisperTranscribeResponseCopyWith<$Res> {
  factory _$$WhisperTranscribeResponseImplCopyWith(
          _$WhisperTranscribeResponseImpl value,
          $Res Function(_$WhisperTranscribeResponseImpl) then) =
      __$$WhisperTranscribeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@type') String type,
      String text,
      @JsonKey(name: 'segments') List<WhisperTranscribeSegment>? segments});
}

/// @nodoc
class __$$WhisperTranscribeResponseImplCopyWithImpl<$Res>
    extends _$WhisperTranscribeResponseCopyWithImpl<$Res,
        _$WhisperTranscribeResponseImpl>
    implements _$$WhisperTranscribeResponseImplCopyWith<$Res> {
  __$$WhisperTranscribeResponseImplCopyWithImpl(
      _$WhisperTranscribeResponseImpl _value,
      $Res Function(_$WhisperTranscribeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = null,
    Object? segments = freezed,
  }) {
    return _then(_$WhisperTranscribeResponseImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      segments: freezed == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<WhisperTranscribeSegment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhisperTranscribeResponseImpl implements _WhisperTranscribeResponse {
  _$WhisperTranscribeResponseImpl(
      {@JsonKey(name: '@type') required this.type,
      required this.text,
      @JsonKey(name: 'segments') required this.segments});

  factory _$WhisperTranscribeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhisperTranscribeResponseImplFromJson(json);

  @override
  @JsonKey(name: '@type')
  String type;
  @override
  String text;
  @override
  @JsonKey(name: 'segments')
  List<WhisperTranscribeSegment>? segments;

  @override
  String toString() {
    return 'WhisperTranscribeResponse(type: $type, text: $text, segments: $segments)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhisperTranscribeResponseImplCopyWith<_$WhisperTranscribeResponseImpl>
      get copyWith => __$$WhisperTranscribeResponseImplCopyWithImpl<
          _$WhisperTranscribeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhisperTranscribeResponseImplToJson(
      this,
    );
  }
}

abstract class _WhisperTranscribeResponse implements WhisperTranscribeResponse {
  factory _WhisperTranscribeResponse(
          {@JsonKey(name: '@type') required String type,
          required String text,
          @JsonKey(name: 'segments')
          required List<WhisperTranscribeSegment>? segments}) =
      _$WhisperTranscribeResponseImpl;

  factory _WhisperTranscribeResponse.fromJson(Map<String, dynamic> json) =
      _$WhisperTranscribeResponseImpl.fromJson;

  @override
  @JsonKey(name: '@type')
  String get type;
  @JsonKey(name: '@type')
  set type(String value);
  @override
  String get text;
  set text(String value);
  @override
  @JsonKey(name: 'segments')
  List<WhisperTranscribeSegment>? get segments;
  @JsonKey(name: 'segments')
  set segments(List<WhisperTranscribeSegment>? value);
  @override
  @JsonKey(ignore: true)
  _$$WhisperTranscribeResponseImplCopyWith<_$WhisperTranscribeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WhisperTranscribeSegment _$WhisperTranscribeSegmentFromJson(
    Map<String, dynamic> json) {
  return _WhisperTranscribeSegment.fromJson(json);
}

/// @nodoc
mixin _$WhisperTranscribeSegment {
  @JsonKey(name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration get fromTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  set fromTs(Duration value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration get toTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  set toTs(Duration value) => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  set text(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhisperTranscribeSegmentCopyWith<WhisperTranscribeSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhisperTranscribeSegmentCopyWith<$Res> {
  factory $WhisperTranscribeSegmentCopyWith(WhisperTranscribeSegment value,
          $Res Function(WhisperTranscribeSegment) then) =
      _$WhisperTranscribeSegmentCopyWithImpl<$Res, WhisperTranscribeSegment>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      Duration fromTs,
      @JsonKey(
          name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      Duration toTs,
      String text});
}

/// @nodoc
class _$WhisperTranscribeSegmentCopyWithImpl<$Res,
        $Val extends WhisperTranscribeSegment>
    implements $WhisperTranscribeSegmentCopyWith<$Res> {
  _$WhisperTranscribeSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromTs = null,
    Object? toTs = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      fromTs: null == fromTs
          ? _value.fromTs
          : fromTs // ignore: cast_nullable_to_non_nullable
              as Duration,
      toTs: null == toTs
          ? _value.toTs
          : toTs // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhisperTranscribeSegmentImplCopyWith<$Res>
    implements $WhisperTranscribeSegmentCopyWith<$Res> {
  factory _$$WhisperTranscribeSegmentImplCopyWith(
          _$WhisperTranscribeSegmentImpl value,
          $Res Function(_$WhisperTranscribeSegmentImpl) then) =
      __$$WhisperTranscribeSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      Duration fromTs,
      @JsonKey(
          name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      Duration toTs,
      String text});
}

/// @nodoc
class __$$WhisperTranscribeSegmentImplCopyWithImpl<$Res>
    extends _$WhisperTranscribeSegmentCopyWithImpl<$Res,
        _$WhisperTranscribeSegmentImpl>
    implements _$$WhisperTranscribeSegmentImplCopyWith<$Res> {
  __$$WhisperTranscribeSegmentImplCopyWithImpl(
      _$WhisperTranscribeSegmentImpl _value,
      $Res Function(_$WhisperTranscribeSegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromTs = null,
    Object? toTs = null,
    Object? text = null,
  }) {
    return _then(_$WhisperTranscribeSegmentImpl(
      fromTs: null == fromTs
          ? _value.fromTs
          : fromTs // ignore: cast_nullable_to_non_nullable
              as Duration,
      toTs: null == toTs
          ? _value.toTs
          : toTs // ignore: cast_nullable_to_non_nullable
              as Duration,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhisperTranscribeSegmentImpl implements _WhisperTranscribeSegment {
  _$WhisperTranscribeSegmentImpl(
      {@JsonKey(
          name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      required this.fromTs,
      @JsonKey(
          name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      required this.toTs,
      required this.text});

  factory _$WhisperTranscribeSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhisperTranscribeSegmentImplFromJson(json);

  @override
  @JsonKey(name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration fromTs;
  @override
  @JsonKey(name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration toTs;
  @override
  String text;

  @override
  String toString() {
    return 'WhisperTranscribeSegment(fromTs: $fromTs, toTs: $toTs, text: $text)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhisperTranscribeSegmentImplCopyWith<_$WhisperTranscribeSegmentImpl>
      get copyWith => __$$WhisperTranscribeSegmentImplCopyWithImpl<
          _$WhisperTranscribeSegmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhisperTranscribeSegmentImplToJson(
      this,
    );
  }
}

abstract class _WhisperTranscribeSegment implements WhisperTranscribeSegment {
  factory _WhisperTranscribeSegment(
      {@JsonKey(
          name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      required Duration fromTs,
      @JsonKey(
          name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
      required Duration toTs,
      required String text}) = _$WhisperTranscribeSegmentImpl;

  factory _WhisperTranscribeSegment.fromJson(Map<String, dynamic> json) =
      _$WhisperTranscribeSegmentImpl.fromJson;

  @override
  @JsonKey(name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration get fromTs;
  @JsonKey(name: 'from_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  set fromTs(Duration value);
  @override
  @JsonKey(name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  Duration get toTs;
  @JsonKey(name: 'to_ts', fromJson: WhisperTranscribeSegment._durationFromInt)
  set toTs(Duration value);
  @override
  String get text;
  set text(String value);
  @override
  @JsonKey(ignore: true)
  _$$WhisperTranscribeSegmentImplCopyWith<_$WhisperTranscribeSegmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WhisperVersionResponse _$WhisperVersionResponseFromJson(
    Map<String, dynamic> json) {
  return _WhisperVersionResponse.fromJson(json);
}

/// @nodoc
mixin _$WhisperVersionResponse {
  @JsonKey(name: '@type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: '@type')
  set type(String value) => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhisperVersionResponseCopyWith<WhisperVersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhisperVersionResponseCopyWith<$Res> {
  factory $WhisperVersionResponseCopyWith(WhisperVersionResponse value,
          $Res Function(WhisperVersionResponse) then) =
      _$WhisperVersionResponseCopyWithImpl<$Res, WhisperVersionResponse>;
  @useResult
  $Res call({@JsonKey(name: '@type') String type, String message});
}

/// @nodoc
class _$WhisperVersionResponseCopyWithImpl<$Res,
        $Val extends WhisperVersionResponse>
    implements $WhisperVersionResponseCopyWith<$Res> {
  _$WhisperVersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhisperVersionResponseImplCopyWith<$Res>
    implements $WhisperVersionResponseCopyWith<$Res> {
  factory _$$WhisperVersionResponseImplCopyWith(
          _$WhisperVersionResponseImpl value,
          $Res Function(_$WhisperVersionResponseImpl) then) =
      __$$WhisperVersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '@type') String type, String message});
}

/// @nodoc
class __$$WhisperVersionResponseImplCopyWithImpl<$Res>
    extends _$WhisperVersionResponseCopyWithImpl<$Res,
        _$WhisperVersionResponseImpl>
    implements _$$WhisperVersionResponseImplCopyWith<$Res> {
  __$$WhisperVersionResponseImplCopyWithImpl(
      _$WhisperVersionResponseImpl _value,
      $Res Function(_$WhisperVersionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$WhisperVersionResponseImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhisperVersionResponseImpl implements _WhisperVersionResponse {
  _$WhisperVersionResponseImpl(
      {@JsonKey(name: '@type') required this.type, required this.message});

  factory _$WhisperVersionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhisperVersionResponseImplFromJson(json);

  @override
  @JsonKey(name: '@type')
  String type;
  @override
  String message;

  @override
  String toString() {
    return 'WhisperVersionResponse(type: $type, message: $message)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhisperVersionResponseImplCopyWith<_$WhisperVersionResponseImpl>
      get copyWith => __$$WhisperVersionResponseImplCopyWithImpl<
          _$WhisperVersionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhisperVersionResponseImplToJson(
      this,
    );
  }
}

abstract class _WhisperVersionResponse implements WhisperVersionResponse {
  factory _WhisperVersionResponse(
      {@JsonKey(name: '@type') required String type,
      required String message}) = _$WhisperVersionResponseImpl;

  factory _WhisperVersionResponse.fromJson(Map<String, dynamic> json) =
      _$WhisperVersionResponseImpl.fromJson;

  @override
  @JsonKey(name: '@type')
  String get type;
  @JsonKey(name: '@type')
  set type(String value);
  @override
  String get message;
  set message(String value);
  @override
  @JsonKey(ignore: true)
  _$$WhisperVersionResponseImplCopyWith<_$WhisperVersionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
