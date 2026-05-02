// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleResponseImpl _$$SampleResponseImplFromJson(Map<String, dynamic> json) =>
    _$SampleResponseImpl(
      success: json['success'] as bool?,
      totalPhotos: (json['total_photos'] as num?)?.toInt(),
      message: json['message'] as String?,
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotosData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SampleResponseImplToJson(
        _$SampleResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total_photos': instance.totalPhotos,
      'message': instance.message,
      'offset': instance.offset,
      'limit': instance.limit,
      'photos': instance.photos,
    };

_$PhotosDataImpl _$$PhotosDataImplFromJson(Map<String, dynamic> json) =>
    _$PhotosDataImpl(
      description: json['description'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      id: (json['id'] as num?)?.toInt(),
      user: (json['user'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PhotosDataImplToJson(_$PhotosDataImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'url': instance.url,
      'title': instance.title,
      'id': instance.id,
      'user': instance.user,
    };
