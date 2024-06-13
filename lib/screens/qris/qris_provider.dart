import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QrisProvider with ChangeNotifier {
  void home() {
    Modular.to.navigate('/navigationPage');
  }

  void toPembayaranQRIS() {
    Modular.to.pushNamed('/PembayaranQRISPage');
  }

  void toQrisBayarPage() {
    Modular.to.pushNamed('/QrisBayarPage');
  }

  void toQRScannerPage() {
    Modular.to.pushNamed('/QRScannerPage');
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  toQRISBayarPage() {}
}
