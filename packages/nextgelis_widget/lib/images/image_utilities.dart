import 'dart:io';
import 'package:flutter/material.dart';

class ImageUtilities {

  static  DecorationImage imageNetwork(String image, {BoxFit? fit}) {
    return DecorationImage(fit: fit ?? BoxFit.cover, image: NetworkImage(image));
  }

  static DecorationImage imageAsset(String image, {BoxFit? fit}) {
    return DecorationImage(fit: fit ?? BoxFit.cover, image: AssetImage(image));
  }

  static DecorationImage imageFile(File image, {BoxFit? fit}) {
    return DecorationImage(fit: fit ?? BoxFit.cover, image: FileImage(image));
  }

}
