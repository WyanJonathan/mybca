import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginProvider with ChangeNotifier {

  final TextEditingController _userPasswordController = TextEditingController();
  late bool _passwordVisible = false;

  TextEditingController? get userPasswordController => _userPasswordController;
  bool get passwordVisible => _passwordVisible;

  set passBehaviour(String val) {
    userPasswordController?.text = val;
    userPasswordController?.selection =
        TextSelection.collapsed(offset: userPasswordController!.text.length);
  }

  set passwordVisible(bool val) {
    _passwordVisible = val;
    notifyListeners();
  }

  void loginPinPage() {
    Modular.to.pushNamed('/loginPinPage');
  }

  void navigationPage() {
    // Modular.to.pushNamed('/home');
    Modular.to.navigate('/navigationPage');
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
