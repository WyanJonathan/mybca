import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginProvider with ChangeNotifier {

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
