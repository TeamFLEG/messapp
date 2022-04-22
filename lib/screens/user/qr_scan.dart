import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/theme/palette.dart';
import 'dart:io';

import '../../main.dart';
import '../../widgets/primary_button.dart';


class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }

    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(head: "QR Scanner"),
          body: Stack(
            children: <Widget>[
              buildQrView(context),
                Align(
                alignment: const Alignment(0.0, 0.7),
                child: buildResult(),
              ),
              PrimaryButton( action: () => navigatorKey.currentState!.pushNamed('/user-dashboard'), btnName: 'Go To Dashboard'),
            ],
          ),
        ),
      );

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.myMaroon,
        ),
        child: Text(
            barcode != null ? 'Attendance Marked for: ${barcode!.code}' : 'Scan a code',
            maxLines: 3,
        style: const TextStyle(
          color: Colors.white,
        ),),
      );



  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {

    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
