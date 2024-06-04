import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransferProvider with ChangeNotifier {

  late List<String> _jumlah = ['150.000,00', '250.000,00', '390.000,00', '50.000,00','250.000,00', '390.000,00', '50.000,00' ];
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _mataUang = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _daftarNorekController = TextEditingController();

  late bool _passwordVisible = false;

  late List<String> _listItems = [
    'Celine Davina Masko',
    'Dofan Claudio Sihotang',
    'I Dewa Made Adi Kresna',
    'Alexandra Adira',
    'Regine Angelina Halim',
    'Pak Stanley A. Makalew',
  ];
  late List<String> _nomor_rekening = <String>['11111', '2435423', '456789', '3087534', '567890', '987654'];
  late List<String> _filteredListItems = _listItems;

  TextEditingController? get nominalController => _nominalController;
  TextEditingController? get mataUang => _mataUang;
  TextEditingController? get notesController => _notesController;
  TextEditingController? get daftarNorekController => _daftarNorekController;

  List<String> get jumlah => _jumlah;
  List<String> get listItems => _listItems;
  List<String> get nomor_rekening => _nomor_rekening;
  List<String> get filteredListItems => _filteredListItems;


  set nominalBehaviour(String val) {
    nominalController?.text = val;
    nominalController?.selection =
        TextSelection.collapsed(offset: nominalController!.text.length);
  }

  set matauangBehaviour(String val) {
    mataUang?.text = val;
    mataUang?.selection =
        TextSelection.collapsed(offset: mataUang!.text.length);
  }

  set notesControllerBehaviour(String val) {
    notesController?.text = val;
    notesController?.selection =
        TextSelection.collapsed(offset: notesController!.text.length);
  }

  set daftarNorekControllerBehaviour(String val) {
    daftarNorekController?.text = val;
    daftarNorekController?.selection =
        TextSelection.collapsed(offset: daftarNorekController!.text.length);
  }

  set jumlah(List<String> value) {
    _jumlah = value;
    notifyListeners();
  }

  set listItems(List<String> value) {
    _listItems = value;
    notifyListeners();
  }

  set nomor_rekening(List<String> value) {
    _nomor_rekening = value;
    notifyListeners();
  }

  set filteredListItems(List<String> value) {
    _filteredListItems = value;
    notifyListeners();
  }

  void keRekeningBCA() {
    nominalController?.clear();
    mataUang?.clear();

    Modular.to.pushNamed('/transferPage2');
  }

  void transferKe(String? name, String? norek) {
    Map<String, dynamic> detail = {'name': name , 'norek': norek};
    Modular.to.pushNamed('/transferPage3', arguments: detail );
  }

  void pinPage(String? name, String? jumlah) {
    Map<String, dynamic> detail = {'name': name , 'jumlah': jumlah};
    Modular.to.pushNamed('/transferPagePin', arguments: detail );
  }

  void printBuktiTransfer(String? name, String? jumlah) {
    Map<String, dynamic> detail = {'name': name , 'jumlah': jumlah};
    Modular.to.navigate('/buktiTransfer', arguments: detail );
  }

  void daftarNorek() {
    Modular.to.pushNamed('/transferPage4');
  }

  void transferPage5() {
    Modular.to.pushNamed('/transferPage2');
  }

  void home() {
    Modular.to.navigate('/navigationPage');
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
