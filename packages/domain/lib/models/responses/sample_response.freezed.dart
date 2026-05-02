// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SampleResponse _$SampleResponseFromJson(Map<String, dynamic> json) {
  return _SampleResponse.fromJson(json);
}

/// @nodoc
mixin _$SampleResponse {
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_photos')
  int? get totalPhotos => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  List<PhotosData>? get photos => throw _privateConstructorUsedError;

  /// Serializes this SampleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleResponseCopyWith<SampleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleResponseCopyWith<$Res> {
  factory $SampleResponseCopyWith(
          SampleResponse value, $Res Function(SampleResponse) then) =
      _$SampleResponseCopyWithImpl<$Res, SampleResponse>;
  @useResult
  $Res call(
      {bool? success,
      @JsonKey(name: 'total_photos') int? totalPhotos,
      String? message,
      int? offset,
      int? limit,
      List<PhotosData>? photos});
}

/// @nodoc
class _$SampleResponseCopyWithImpl<$Res, $Val extends SampleResponse>
    implements $SampleResponseCopyWith<$Res> {
  _$SampleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? totalPhotos = freezed,
    Object? message = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? photos = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalPhotos: freezed == totalPhotos
          ? _value.totalPhotos
          : totalPhotos // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotosData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleResponseImplCopyWith<$Res>
    implements $SampleResponseCopyWith<$Res> {
  factory _$$SampleResponseImplCopyWith(_$SampleResponseImpl value,
          $Res Function(_$SampleResponseImpl) then) =
      __$$SampleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      @JsonKey(name: 'total_photos') int? totalPhotos,
      String? message,
      int? offset,
      int? limit,
      List<PhotosData>? photos});
}

/// @nodoc
class __$$SampleResponseImplCopyWithImpl<$Res>
    extends _$SampleResponseCopyWithImpl<$Res, _$SampleResponseImpl>
    implements _$$SampleResponseImplCopyWith<$Res> {
  __$$SampleResponseImplCopyWithImpl(
      _$SampleResponseImpl _value, $Res Function(_$SampleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? totalPhotos = freezed,
    Object? message = freezed,
    Object? offset = freezed,
    Object? limit = freezed,
    Object? photos = freezed,
  }) {
    return _then(_$SampleResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalPhotos: freezed == totalPhotos
          ? _value.totalPhotos
          : totalPhotos // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotosData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SampleResponseImpl implements _SampleResponse {
  const _$SampleResponseImpl(
      {this.success,
      @JsonKey(name: 'total_photos') this.totalPhotos,
      this.message,
      this.offset,
      this.limit,
      final List<PhotosData>? photos})
      : _photos = photos;

  factory _$SampleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SampleResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  @JsonKey(name: 'total_photos')
  final int? totalPhotos;
  @override
  final String? message;
  @override
  final int? offset;
  @override
  final int? limit;
  final List<PhotosData>? _photos;
  @override
  List<PhotosData>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SampleResponse(success: $success, totalPhotos: $totalPhotos, message: $message, offset: $offset, limit: $limit, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalPhotos, totalPhotos) ||
                other.totalPhotos == totalPhotos) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, totalPhotos, message,
      offset, limit, const DeepCollectionEquality().hash(_photos));

  /// Create a copy of SampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleResponseImplCopyWith<_$SampleResponseImpl> get copyWith =>
      __$$SampleResponseImplCopyWithImpl<_$SampleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SampleResponseImplToJson(
      this,
    );
  }
}

abstract class _SampleResponse implements SampleResponse {
  const factory _SampleResponse(
      {final bool? success,
      @JsonKey(name: 'total_photos') final int? totalPhotos,
      final String? message,
      final int? offset,
      final int? limit,
      final List<PhotosData>? photos}) = _$SampleResponseImpl;

  factory _SampleResponse.fromJson(Map<String, dynamic> json) =
      _$SampleResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  @JsonKey(name: 'total_photos')
  int? get totalPhotos;
  @override
  String? get message;
  @override
  int? get offset;
  @override
  int? get limit;
  @override
  List<PhotosData>? get photos;

  /// Create a copy of SampleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleResponseImplCopyWith<_$SampleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotosData _$PhotosDataFromJson(Map<String, dynamic> json) {
  return _PhotosData.fromJson(json);
}

/// @nodoc
mixin _$PhotosData {
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;

  /// Serializes this PhotosData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotosData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotosDataCopyWith<PhotosData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosDataCopyWith<$Res> {
  factory $PhotosDataCopyWith(
          PhotosData value, $Res Function(PhotosData) then) =
      _$PhotosDataCopyWithImpl<$Res, PhotosData>;
  @useResult
  $Res call(
      {String? description, String? url, String? title, int? id, int? user});
}

/// @nodoc
class _$PhotosDataCopyWithImpl<$Res, $Val extends PhotosData>
    implements $PhotosDataCopyWith<$Res> {
  _$PhotosDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotosData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? id = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosDataImplCopyWith<$Res>
    implements $PhotosDataCopyWith<$Res> {
  factory _$$PhotosDataImplCopyWith(
          _$PhotosDataImpl value, $Res Function(_$PhotosDataImpl) then) =
      __$$PhotosDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? description, String? url, String? title, int? id, int? user});
}

/// @nodoc
class __$$PhotosDataImplCopyWithImpl<$Res>
    extends _$PhotosDataCopyWithImpl<$Res, _$PhotosDataImpl>
    implements _$$PhotosDataImplCopyWith<$Res> {
  __$$PhotosDataImplCopyWithImpl(
      _$PhotosDataImpl _value, $Res Function(_$PhotosDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotosData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? id = freezed,
    Object? user = freezed,
  }) {
    return _then(_$PhotosDataImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosDataImpl implements _PhotosData {
  const _$PhotosDataImpl(
      {this.description, this.url, this.title, this.id, this.user});

  factory _$PhotosDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosDataImplFromJson(json);

  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? title;
  @override
  final int? id;
  @override
  final int? user;

  @override
  String toString() {
    return 'PhotosData(description: $description, url: $url, title: $title, id: $id, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosDataImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, url, title, id, user);

  /// Create a copy of PhotosData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosDataImplCopyWith<_$PhotosDataImpl> get copyWith =>
      __$$PhotosDataImplCopyWithImpl<_$PhotosDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosDataImplToJson(
      this,
    );
  }
}

abstract class _PhotosData implements PhotosData {
  const factory _PhotosData(
      {final String? description,
      final String? url,
      final String? title,
      final int? id,
      final int? user}) = _$PhotosDataImpl;

  factory _PhotosData.fromJson(Map<String, dynamic> json) =
      _$PhotosDataImpl.fromJson;

  @override
  String? get description;
  @override
  String? get url;
  @override
  String? get title;
  @override
  int? get id;
  @override
  int? get user;

  /// Create a copy of PhotosData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotosDataImplCopyWith<_$PhotosDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
