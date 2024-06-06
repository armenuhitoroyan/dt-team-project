import 'dart:typed_data';

import 'package:chat_messanger_app/base/routes.dart';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  bool _isScanning = false;
  Uint8List? _backgroundImage;

  void _startScanning() {
    setState(() {
      _isScanning = true;
    });
    _controller.start();
  }

  void _stopScanning() {
    setState(() {
      _isScanning = false;
    });
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.generateQRCode),
            icon: const Icon(Icons.qr_code),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_backgroundImage != null)
            Image.memory(
              _backgroundImage!,
              fit: BoxFit.cover,
            ),
          Column(
            children: [
              Expanded(
                child: _isScanning
                    ? MobileScanner(
                        controller: _controller,
                        onDetect: (capture) {
                          print(capture);
                          final List<Barcode> barcodes = capture.barcodes;
                          final Uint8List? image = capture.image;

                          for (final barcode in barcodes) {
                            print('Barcode found! ${barcode.rawValue}');
                          }
                          if (image != null) {
                            setState(() {
                              _backgroundImage = image;
                            });
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(barcodes.first.rawValue ?? ''),
                                  content: Image(
                                    image: MemoryImage(image),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _stopScanning();
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                      )
                    : Center(
                        child: ElevatedButton(
                          onPressed: _startScanning,
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          child: const Text(''),
                        ),
                      ),
              ),
              if (_isScanning)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _stopScanning,
                    child: const Text('Stop Scanning'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
