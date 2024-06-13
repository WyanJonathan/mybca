import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QrisProvider with ChangeNotifier {

  final TextEditingController _nominalController = TextEditingController();
  TextEditingController? get nominalController => _nominalController;

  set nominalBehaviour(String val) {
    nominalController?.text = val;
    nominalController?.selection =
        TextSelection.collapsed(offset: nominalController!.text.length);
  }

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

  void pinPage(String? name, String? jumlah) {
    Map<String, dynamic> detail = {'name': name , 'jumlah': jumlah};
    Modular.to.pushNamed('/transferPagePin', arguments: detail );
  }

  void printBuktiTransfer(String? name, String? jumlah) {
    Map<String, dynamic> detail = {'name': name , 'jumlah': jumlah};
    Modular.to.navigate('/buktiTransfer', arguments: detail );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  toQRISBayarPage() {}
}
