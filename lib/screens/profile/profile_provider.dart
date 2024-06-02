import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileProvider with ChangeNotifier {

  late String _norek = "123-456-789";


  String get norek => _norek;


  set norek(String value) {
    _norek = value;
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
