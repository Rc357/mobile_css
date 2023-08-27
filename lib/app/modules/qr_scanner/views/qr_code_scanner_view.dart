import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controller/qr_code_scanner_controller.dart';

class QRScanLoginView extends StatefulWidget {
  const QRScanLoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScanLoginViewState();
}

class _QRScanLoginViewState extends State<QRScanLoginView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final qRScanLoginController = QRScanLoginController.instance;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => qRScanLoginController.isLoading
          ? Center(
              child: LoadingBouncingGrid.circle(
                  backgroundColor: Colors.blue.shade200,
                  duration: const Duration(milliseconds: 500)),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('QR Login'),
                backgroundColor: Colors.blue,
                centerTitle: true,
                automaticallyImplyLeading: true,
                elevation: 0,
              ),
              floatingActionButton: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  left: 40.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      tooltip: 'Flash',
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      backgroundColor: Colors.blue.shade400.withOpacity(.4),
                      child: const Icon(
                        Icons.flashlight_on,
                        color: Colors.black,
                      ),
                    ),
                    FloatingActionButton(
                      tooltip: 'Rotate Camera',
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      },
                      backgroundColor: Colors.blue.shade400.withOpacity(.4),
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return const Icon(
                                  Icons.rotate_left,
                                  color: Colors.black,
                                );
                              } else {
                                return const Icon(
                                  Icons.circle_outlined,
                                  color: Colors.black,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(child: _buildQrView(context)),
                ],
              ),
            ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color.fromARGB(255, 56, 2, 250),
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      qRScanLoginController.loginViaQR(result);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
