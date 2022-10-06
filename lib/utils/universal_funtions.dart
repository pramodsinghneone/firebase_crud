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
      print('image $image');
      if (image != null) {
        var imageFile = File(image.path);
        pickedFile = imageFile;
      }
    }
  } catch (e) {
    print('error occured uni fun${e.toString()}');
  }

  return pickedFile!;
}

Future<bool> permissionCheck({String pickType = 'gallery'}) async {
  bool permissionGranted = false;
  PermissionStatus status;

  if (!kIsWeb) {
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted &&
        statusStorage == PermissionStatus.granted &&
        statusPhotos == PermissionStatus.granted;

    if (isGranted) {
      permissionGranted = true;
    }
  } else {
    permissionGranted = true;
  }

  return permissionGranted;
}
