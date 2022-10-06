import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File> pickImage({String pickType = 'gallery'}) async {
  File? pickedFile;
  final XFile? image;
  final ImagePicker _picker = ImagePicker();

  try {
    var granted = await permissionCheck(pickType: pickType);
    if (granted) {
      if (kIsWeb) {
        image = await _picker.pickImage(source: ImageSource.gallery);
      } else {
        if (pickType == 'gallery') {
          image = await _picker.pickImage(source: ImageSource.gallery);
        } else {
          image = await _picker.pickImage(source: ImageSource.camera);
        }
      }
      if (image != null) {
        var imageFile = File(image.path);
        pickedFile = imageFile;
      }
    }
  } catch (e) {
    print(e.toString());
  }
  return pickedFile!;
}

Future<bool> permissionCheck({String pickType = 'gallery'}) async {
  bool permissionGranted = false;
  PermissionStatus status;
  if (!kIsWeb) {
    if (pickType == 'gallery') {
      await Permission.photos.request();
      status = await Permission.photos.status;
    } else {
      await Permission.camera.request();
      status = await Permission.camera.status;
    }
    if (status.isGranted) {
      permissionGranted = true;
    }
  } else {
    permissionGranted = true;
  }

  return permissionGranted;
}
