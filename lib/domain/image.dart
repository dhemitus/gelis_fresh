import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class ImageUtils {

  static  DecorationImage imageContainer(String image) {
    return DecorationImage(fit: BoxFit.cover, image: NetworkImage(image));
  }

  static DecorationImage imageAsset(String image, {BoxFit? fit}) {
    return DecorationImage(fit: fit ?? BoxFit.cover, image: AssetImage(image));
  }

  static DecorationImage imageFile(File image, {BoxFit? fit}) {
    return DecorationImage(fit: fit ?? BoxFit.cover, image: FileImage(image));
  }

  static Future<File> load() async {
    ImagePicker picker = ImagePicker();
    File? picture;

    XFile? file = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1024, maxHeight: 1024, imageQuality: 60);
    file != null ? picture = File(file.path) : null;

    return picture!;
  }

  static Future<File> capture() async {
    ImagePicker picker = ImagePicker();
    File? picture;

    XFile? file = await picker.pickImage(source: ImageSource.camera, maxWidth: 1024, maxHeight: 1024, imageQuality: 60);
    file != null ? picture = File(file.path) : null;

    return picture!;
  }
  
  static Future<XFile> xload() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1024, maxHeight: 1024, imageQuality: 60);
    
    return file!;
  }

  static String convert(File f) {
    Uint8List byt = f.readAsBytesSync();

    return 'data:image/jpeg;base64,${base64Encode(byt)}';
  }
}
