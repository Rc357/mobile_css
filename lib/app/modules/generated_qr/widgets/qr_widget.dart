import 'package:css/app/helpers/image_path_helper.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget {
  const QRWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        eyeStyle:
            const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
        dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square, color: Colors.black),
        embeddedImage: const AssetImage(ImagePath.schoolLogo),
        embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(30, 30)),
        size: 250.0,
      ),
    );
  }
}
