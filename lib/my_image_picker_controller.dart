import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyImagePickerController extends GetxController {
  late File? imageFile = null;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    imageFile = File(pickedFile!.path);

    update();
  }

    clearimage() {
    imageFile = null;
    update();
  }
}
