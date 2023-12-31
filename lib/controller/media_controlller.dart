import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/image_model.dart';

class MediaController extends GetxController {
  List<ImageModel> imgPaths = [];
  var caption = TextEditingController();

  Future<String> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (image != null) {
      return image.path;
    }
    return "";
  }

//    Future<List> pickImages(ImageSource source) async {
//     final ImagePicker picker = ImagePicker();
// // Pick an image.
//     final List<XFile> images = await picker.pickMultiImage();
//     if (images.isNotEmpty) {
//       var imagePaths = [];
//       for (var image in images) {
//         imagePaths.add(image.path);
//       }
//       return imagePaths;
//     }
//     return [];
//   }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
    }
    return null;
  }
}
