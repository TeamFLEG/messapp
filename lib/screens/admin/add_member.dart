import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:messapp/widgets/custom_appbar.dart';
import 'package:messapp/theme/palette.dart';
import 'dart:io';


class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? scannedString;

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
      appBar: const CustomAppBar(head: "Add Member"),
      body: Stack(
        children: <Widget>[
          buildQrView(context),
          //   Align(
          //   alignment: const Alignment(0.0, 0.7),
          //   child: buildResult(),
          // ),
        ],
      ),
    ),
  );

  // Widget buildResult() => Container(
  //       padding: const EdgeInsets.all(12.0),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         color: Palette.myMaroon,
  //       ),
  //       child: Text(
  //           scannedString != null ? 'Result : ${scannedString!.code}' : 'Scan a code',
  //           maxLines: 3,
  //       style: const TextStyle(
  //         color: Colors.white,
  //       ),),
  //     );



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
        .listen((scannedString) => setState(() => this.scannedString = scannedString));
  }
}
