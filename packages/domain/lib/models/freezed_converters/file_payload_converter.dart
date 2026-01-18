part of 'converters.dart';

class FilePayloadConverter implements JsonConverter<File?, MultipartFile?> {
  const FilePayloadConverter();

  @override
  File? fromJson(MultipartFile? json) => null;

  @override
  MultipartFile? toJson(File? file) => file == null ? null : MultipartFile.fromFileSync(file.path);
}
