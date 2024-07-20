
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:typed_data';

class qrisBuktiTransfer extends StatefulWidget {
  @override
  _qrisBuktiTransferState createState() => _qrisBuktiTransferState();
}

class _qrisBuktiTransferState extends State<qrisBuktiTransfer> {
  ScreenshotController screenshotController = ScreenshotController();
  Map<String, dynamic> detail = Modular.args.data;
  String date = DateFormat("dd MMMM yyyy HH:MM:s").format(DateTime.now());
  TransferProvider provider2 = Modular.get<TransferProvider>();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context),
                child: Scaffold(
                  body: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            IconButton(
                              icon: Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                label: "Kembali ke Beranda",
                                child: const Icon(Icons.arrow_back_ios, size: 40),
                              ),
                              onPressed: () => provider2.backHome(),
                            ),
                            Center(
                              child: Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                label: "Logo BCA",
                                enabled: false,
                                child: const SizedBox(
                                  child: Image(image: AssetImage('assets/logobca2.png'), height: 50),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: List.generate(150 ~/ 2, (index) => Expanded(
                                child: Container(
                                  color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                                  height: 2,
                                ),
                              )),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/bukti_transaksi.png'), height: 90),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  widgetFont("Pembayaran Berhasil", jumbo2),
                                  widgetFont("IDR ${detail['jumlah']}", jumbo6),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: List.generate(150 ~/ 2, (index) => Expanded(
                                child: Container(
                                  color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                                  height: 2,
                                ),
                              )),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            widgetFont("Detail Transaksi", jumbo2),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            widgetFont("Tanggal Transaksi", title2),
                            widgetFont(date, jumbo2),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            widgetFont("Pembayaran Ke", title2),
                            widgetFont("${detail['name']}", jumbo2),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            widgetFont("Total Bayar", title2),
                            widgetFont("${detail['jumlah']}", jumbo2),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            widgetFont("No Referensi", title2),
                            widgetFont("123456789", jumbo2),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: BottomAppBar(
                    elevation: 10,
                    color: Colors.white,
                    child: Container(
                      // height: 60,
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff1e5fad),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  captureImage();
                                  // provider2.screenshot();
                                  // final image = await screenshotController.captureFromWidget(
                                  //   BuktiTransfer(),
                                  //   pixelRatio: 2,
                                  // );
                                  // Share.shareXFiles([XFile.fromData(image, mimeType: "image/png")]);
                                },
                                child: widgetFont('Share', jumbo1),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff1e5fad),
                              ),
                              child: TextButton(
                                onPressed: () => provider2.home(),
                                child: widgetFont('Selesai', jumbo1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ), // Place the widget you want to capture here
    );
  }

  // Call this function to capture and obtain the image
  void captureImage() async {
    final Uint8List? capturedImage = await screenshotController.capture();
    if (capturedImage != null) {
      // Use the capturedImage
      Share.shareXFiles([XFile.fromData(capturedImage, mimeType: "image/png")]);

    }
  }
}