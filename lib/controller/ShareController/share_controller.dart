import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareController extends GetxController {
 

  Future<void> captureandImage(GlobalKey _shareglobalKey) async {
    try {
      RenderRepaintBoundary? boundary = _shareglobalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      if (boundary != null) {
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          Uint8List pngBytes = byteData.buffer.asUint8List();

          final directory = await getApplicationCacheDirectory();
          final imagePath = '${directory.path}/screenshot.png';
          final imageFile = File(imagePath)..writeAsBytesSync(pngBytes);

          await Share.shareFiles([imageFile.path],
              subject: "download app on playstore",
              text: 'Perform seemless transactions on NEXTELLAR');
        }
      }
    } catch (error) {
      print('Error capturing screen: $error');
    }
  }

}
