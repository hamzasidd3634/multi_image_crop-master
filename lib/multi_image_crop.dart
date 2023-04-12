library multi_image_crop;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_image_crop/src/multi_image_crop.dart';

/// Method [startCropping] open new screen where all selected images crop at
/// single click. Parameter [pixelRatio] define the quality of crop image and
/// parameter [aspectRatio] is ratio of image in which image will crop.

class MultiImageCrop {
  static startCropping({
    required BuildContext context,
    required List<File> files,
    required double aspectRatio,
    bool alwaysShowGrid = false,
    bool fromHeroSelection = false,
    bool isLeading = true,
    double? pixelRatio,
    Color? activeColor,
    Function? callBack,
    Function(File, String)? heroCallBack,
  }) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiImageCropService(
                  files: files,
                  pixelRatio: pixelRatio,
                  activeColor: activeColor,
                  isLeading: isLeading,
                  fromHeroSelection: fromHeroSelection,
                  alwaysShowGrid: alwaysShowGrid,
                  aspectRatio: aspectRatio,
                ))).then((value) {
      if (value != null) {
        print(value);
        if (fromHeroSelection == true) {
          CroppedFile croppedFile = CroppedFile.fromJson(value);
          heroCallBack!(value, value);
        } else {
          callBack!(value);
        }
      }
    });
  }
}
