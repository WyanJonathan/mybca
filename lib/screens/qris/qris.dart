import 'package:flutter/material.dart';
import 'package:mybca_prototype/screens/qris/qris_provider.dart';
import 'package:mybca_prototype/screens/qris/scanned_barcode_label.dart';
import 'package:mybca_prototype/screens/qris/scanner_button_widgets.dart';
import 'package:mybca_prototype/screens/qris/scanner_error_widget.dart';
import 'package:mybca_prototype/screens/qris/scanner_overlay_widget.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  QrisProvider provider = Modular.get<QrisProvider>();
  Barcode? _barcode;

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }

  void _handleOnDetect(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
        if (_barcode != null) {
          provider.toPembayaranQRIS();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanWindow = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 200,
      height: 200,
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Scan QRIS", title4),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 150,
              color: Color(0xFF0060AF),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(0.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Center(
                              child: MobileScanner(
                                fit: BoxFit.fill,
                                controller: controller,
                                scanWindow: scanWindow,
                                onDetect: _handleOnDetect,
                                errorBuilder: (context, error, child) {
                                  return ScannerErrorWidget(error: error);
                                },
                                overlayBuilder: (context, constraints) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ScannedBarcodeLabel(
                                          barcodes: controller.barcodes),
                                    ),
                                  );
                                },
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: controller,
                              builder: (context, value, child) {
                                if (!value.isInitialized ||
                                    !value.isRunning ||
                                    value.error != null) {
                                  return const SizedBox();
                                }
                                return CustomPaint(
                                  painter:
                                      ScannerOverlay(scanWindow: scanWindow),
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ToggleFlashlightButton(
                                        controller: controller),
                                    AnalyzeImageFromGalleryButton(
                                        controller: controller),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 65,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0060AF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Bayar',
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 65,
                        child: OutlinedButton(
                          onPressed: () => provider.toQrisBayarPage(),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xFF0060AF), width: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Transfer',
                            style: TextStyle(fontSize: 20, color:  Color(0xFF0060AF),fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
