import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PickFiles {
  PickFiles._() : imagePicker = ImagePicker();

  static final instance = PickFiles._();

  final ImagePicker imagePicker;

  Future<File?> pickImage() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if ((result?.path != null) && (result?.path.isNotEmpty ?? false)) {
      final File file = File(result?.path ?? '');
      return file;
    } else {
      return null;
    }
  }
}
