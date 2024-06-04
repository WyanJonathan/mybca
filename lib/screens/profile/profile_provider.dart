import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileProvider with ChangeNotifier {

  late String _nokartu = "4691 5112 3456 7890";


  String get nokartu => _nokartu;


  set nokartu(String value) {
    _nokartu = value;
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
