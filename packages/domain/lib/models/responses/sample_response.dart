import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_response.freezed.dart';
part 'sample_response.g.dart';

@freezed
class SampleResponse with _$SampleResponse {
  const factory SampleResponse({
    bool? success,
    @JsonKey(name: 'total_photos') int? totalPhotos,
    String? message,
    int? offset,
    int? limit,
    List<PhotosData>? photos,
  }) = _SampleResponse;

  factory SampleResponse.fromJson(Map<String, dynamic> json) =>
      _$SampleResponseFromJson(json);
}

@freezed
class PhotosData with _$PhotosData {
  const factory PhotosData({
    String? description,
    String? url,
    String? title,
    int? id,
    int? user,
  }) = _PhotosData;

  factory PhotosData.fromJson(Map<String, dynamic> json) =>
      _$PhotosDataFromJson(json);
}