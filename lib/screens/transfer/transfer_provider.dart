import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransferProvider with ChangeNotifier {

  late List<String> _jumlah = ['150.000,00', '250.000,00', '390.000,00', '50.000,00','250.000,00', '390.000,00', '50.000,00' ];

  List<String> get jumlah => _jumlah;

  set jumlah(List<String> value) {
    _jumlah = value;
    notifyListeners();
  }

  void keRekeningBCA() {
    Modular.to.pushNamed('/transferPage2');
  }

  void transferKe(String? name, String? norek) {
    Map<String, dynamic> detail = {'name': name , 'norek': norek};
    Modular.to.pushNamed('/transferPage3', arguments: detail );
  }

  void daftarNorek() {
    Modular.to.pushNamed('/transferPage4');
  }


  // void tampilkan() {
  //   Asuka.showDialog(
  //     builder: (context) => AlertDialog(
  //       title: const Text('Informasi Riwayat Transaksi'),
  //       content: const Text('Belum ada desainnya'),
  //       actions: [
  //         // TextButton(
  //         //   onPressed: () {
  //         //     Navigator.pop(context);
  //         //   },
  //         //   child: const Text('Cancel'),
  //         // ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text('Ok'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void home() {
  //   // Modular.to.pushNamed('/home');
  //   Modular.to.navigate('/riwayatPage2');
  // }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
