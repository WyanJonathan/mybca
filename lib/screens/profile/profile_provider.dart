import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileProvider with ChangeNotifier {

  late String _nokartu = "4691 5112 3456 7890";
  late bool _obscure = true;

  final TextEditingController _userPasswordController = TextEditingController();
  late bool _passwordVisible = false;

  String get nokartu => _nokartu;
  bool get obscure => _obscure;

  TextEditingController? get userPasswordController => _userPasswordController;
  bool get passwordVisible => _passwordVisible;

  set obscure(bool val) {
    _obscure = val;
    notifyListeners();
  }

  set nokartu(String value) {
    _nokartu = value;
    notifyListeners();
  }

  set passBehaviour(String val) {
    userPasswordController?.text = val;
    userPasswordController?.selection =
        TextSelection.collapsed(offset: userPasswordController!.text.length);
  }

  set passwordVisible(bool val) {
    _passwordVisible = val;
    notifyListeners();
  }


  void riwayatPage2() {
    Modular.to.pushNamed('/riwayatPage2');
  }

  void riwayatPage3() {
    Modular.to.pushNamed('/riwayatPage3');
  }

  void tampilkan() {
    Asuka.showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Informasi Riwayat Transaksi'),
        content: const Text('Belum ada desainnya'),
        actions: [
          // TextButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Cancel'),
          // ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  // void home() {
  //   // Modular.to.pushNamed('/home');
  //   Modular.to.navigate('/riwayatPage2');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
