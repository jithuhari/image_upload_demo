import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image_demo/my_image_picker_controller.dart';

class MyImagePicker extends StatelessWidget {
  const MyImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyImagePickerController>(
        init: MyImagePickerController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Image Picker'),
            ),
            body: Center(
              child: controller.imageFile != null
                  ? Image.file(controller.imageFile!)
                  : const Text('No image selected.'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text('Take a picture'),
                            onTap: () {
                              controller.pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text('Choose from gallery'),
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              tooltip: 'Pick Image',
              child: const Icon(Icons.add_a_photo),
            ),
          );
        });
  }
}
