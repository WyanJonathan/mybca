import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RiwayatProvider with ChangeNotifier {

  late String _norek = "123-456-789";

  late List<String> _entries = ['05/25 CELINE DAVINA TRSF E-BANKING CR', 'TRANSFER KE 201 REGINE HA M-BCA BI-FAST DB', '05/12 ADI KRESNA TRSF E-BANKING CR', '05/04 RAHMA SARI TRSF E-BANKING CR',  '05/02 PAK STANLEY A M TRSF E-BANKING CR', '05/25 ZAHID TRSF E-BANKING CR','05/25 CELINE DAVINA TRSF E-BANKING CR'];
  late List<String> _jumlah = ['150.000,00', '250.000,00', '390.000,00', '50.000,00','250.000,00', '390.000,00', '50.000,00' ];
  late List<String> _bulan = ['Mei','Mei','Mei','Mei','Mei','Mei','Mei'];
  late List<int> _date = [31,28,22,18,09,05,02];
  late List<int> _status = [1,0,1,1,0,1,0];

  String get norek => _norek;
  List<String> get entries => _entries;
  List<String> get jumlah => _jumlah;
  List<String> get bulan => _bulan;
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


  void riwayatPage2() {
    Modular.to.pushNamed('/riwayatPage2');
  }

  void riwayatPage3() {
    Modular.to.pushNamed('/riwayatPage3');
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
