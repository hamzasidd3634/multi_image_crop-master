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
    bool noBack = false,
    double? pixelRatio,
    Color? activeColor,
    Function? callBack,
    Function(List<CroppedFile>)? heroCallBack,
  }) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiImageCropService(
                  files: files,
                  pixelRatio: pixelRatio,
                  activeColor: activeColor,
                  isLeading: isLeading,
              noBack: noBack,
                  fromHeroSelection: fromHeroSelection,
                  alwaysShowGrid: alwaysShowGrid,
                  aspectRatio: aspectRatio,
                ))).then((value) {
      if (value != null) {
        print(value);
        if (fromHeroSelection == true) {
          List<CroppedFile> croppedFile = value as List<CroppedFile>;
          print(croppedFile);
          // List<CroppedFile>.from(value.map((x) => CroppedFile.fromJson(x)));
          heroCallBack!(croppedFile);
        } else {
          callBack!(value);
        }
      }
    });
  }
}

class CroppedFile {
  File? file;
  String? text;
  CroppedFile({this.file, this.text});

  factory CroppedFile.fromJson(List<CroppedFile> json) =>
      CroppedFile(file: json[0].file, text: json[0].text);
}
