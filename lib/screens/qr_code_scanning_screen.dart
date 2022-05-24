import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanningScreen extends StatefulWidget {
  static const routeName = '/qr_code_scanning_screen';

  @override
  State<QrCodeScanningScreen> createState() => _QrCodeScanningScreenState();
}

class _QrCodeScanningScreenState extends State<QrCodeScanningScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? _qrViewController;

  @override
  void dispose() {
    _qrViewController!.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController _qrViewController) {
    setState(() {
      this._qrViewController = _qrViewController;
    });
    _qrViewController.scannedDataStream.listen(
      (result) => setState(() {
        this.result = result;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr_Code Scanning'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderRadius: 10,
              borderLength: 20,
              borderWidth: 10,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
              borderColor: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white38,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FutureBuilder<bool?>(
                      future: _qrViewController?.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(snapshot.data!
                              ? Icons.flash_on
                              : Icons.flash_off);
                        } else {
                          return Container();
                        }
                      },
                    ),
                    onPressed: () async {
                      await _qrViewController?.toggleFlash();
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: FutureBuilder(
                      future: _qrViewController?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return const Icon(Icons.switch_camera);
                        } else {
                          return Container();
                        }
                      },
                    ),
                    onPressed: () async {
                      await _qrViewController?.flipCamera();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
              child: Text(
                result != null ? "Result : ${result!.code}" : "Scan a code!",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
