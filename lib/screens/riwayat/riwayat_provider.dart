import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RiwayatProvider with ChangeNotifier {

  late String _norek = "123-456-789";

  late List<String> _entries = ['31 Mei Oleh CELINE DAVINA TRSF E-BANKING CR', '28 Mei TRANSFER KE 201 REGINE HA M-BCA BI-FAST DB', '22 Mei Oleh ADI KRESNA TRSF E-BANKING CR', '18 Mei Oleh RAHMA SARI TRSF E-BANKING CR',  '09 Mei TRANSFER KE PAK STANLEY A M TRSF E-BANKING CR', '5 Mei Oleh ZAHID TRSF E-BANKING CR','2 Mei TRANSFER KE CELINE DAVINA TRSF E-BANKING CR'];
  late List<String> _jumlah = ['150.000,00', '250.000,00', '390.000,00', '50.000,00','250.000,00', '390.000,00', '50.000,00' ];
  late List<String> _bulan = ['Mei','Mei','Mei','Mei','Mei','Mei','Mei'];
  late List<String> _statusUang = ['Uang Masuk','Uang Keluar','Uang Masuk','Uang Masuk','Uang Keluar','Uang Masuk','Uang Keluar'];
  late List<int> _date = [31,28,22,18,09,05,02];
  late List<int> _status = [1,0,1,1,0,1,0];

  String get norek => _norek;
  List<String> get entries => _entries;
  List<String> get jumlah => _jumlah;
  List<String> get bulan => _bulan;
  List<String> get statusUang => _statusUang;
  List<int> get date => _date;
  List<int> get status => _status;

  set norek(String value) {
    _norek = value;
    notifyListeners();
  }
  set entries(List<String> value) {
    _entries = value;
    notifyListeners();
  }
  set jumlah(List<String> value) {
    _jumlah = value;
    notifyListeners();
  }
  set bulan(List<String> value) {
    _bulan = value;
    notifyListeners();
  }
  set date(List<int> value) {
    _date = value;
    notifyListeners();
  }
  set status(List<int> value) {
    _status = value;
    notifyListeners();
  }
  set statusUang(List<String> value) {
    _statusUang = value;
    notifyListeners();
  }

  void riwayatPage2() {
    Modular.to.pushNamed('/riwayatPage2');
  }

  // void riwayatPage2(String? month) {
  //   Map<String, dynamic> detail = {'month': month};
  //   Modular.to.pushNamed('/riwayatPage2', arguments: detail );
  // }

  void riwayatPage3() {
    Modular.to.pushNamed('/riwayatPage3');
  }

  // void riwayatPage3(String? month) {
  //   Map<String, dynamic> detail = {'month': month};
  //   Modular.to.pushNamed('/riwayatPage3', arguments: detail );
  // }

  // void tampilkan(start, end, month) {
  //   Modular.to.pushNamed('/riwayatPage4');
  // }

  void tampilkan(DateTime? start, DateTime? end, String? month) {
    Map<String, dynamic> detail = {'start' : start, 'end' : end, 'month': month};
    Modular.to.pushNamed('/riwayatPage4', arguments: detail );
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
