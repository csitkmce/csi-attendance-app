import 'dart:io';

import 'package:csi_attendance/controllers/main_controller.dart';
import 'package:csi_attendance/pages/login/widgets/rect_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRScanPage();
}

class _QRScanPage extends State<QRScanPage> {
  Barcode? result;
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  MainController mainController = Get.find<MainController>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 200,
                      width: 200,
                      child: _buildQrView(context),
                    ),
                  ],
                ),
              ),
              RectButton(
                text: 'Go back',
                onTap: (text) {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea =
        (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.qrController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code!.isNotEmpty) {
          mainController.onQRdetect(result!.code!);
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }
}
