import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageHelper {
  static Future<Uint8List> compressImage(File image) async {
    return await FlutterImageCompress.compressWithFile(
      image.absolute.path,
      minHeight: 1280,
      minWidth: 1980,
      quality: 40,
    );
  }
}
