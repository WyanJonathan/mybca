import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mybca_prototype/screens/login/login_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isAuthenticated = false;
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    LoginProvider provider = Modular.get<LoginProvider>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color(0xFF0060AF),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Semantics(
          label: "Logo BCA",
          enabled: false,
          child: const SizedBox(
              child : Image(image : AssetImage('assets/logobca.png'))
          ),
        ),
      ),
      body: Container(
        color: Colors.white,//Color(0xFF0060AF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Color(0xFF0060AF),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(0.0)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Semantics(
                          label: "Ini nama akun kamu",
                          readOnly: true,
                          child: widgetFont("User1 test", title1)),
                      Semantics(
                          label: 'Akun ini dibuat dan diperuntukkan prototype testing saja, ini adalah kode akunnya',
                          child: widgetFont("Testing", title2)),
                      const SizedBox(height: 130),
                      Semantics(
                        label: 'Untuk masuk ke akun kamu, kamu bisa menggunakan dua cara yaitu pin dan fingerprint',
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                              onPressed: () => provider.loginPinPage(),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0)),
                                    color: Color(0xff1e5fad),
                                  ),
                                padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                                  child: widgetFont('Pin', jumbo1)))
                          ),
                      ),
                      SizedBox(height: 20,),
                      Center(child: widgetFont("Atau", title1)),
                      SizedBox(height: 20,),
                      // Container(
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(20.0),
                      //         bottomRight: Radius.circular(0.0),
                      //         topLeft: Radius.circular(20.0),
                      //         bottomLeft: Radius.circular(0.0)),
                      //     color: Colors.white,
                      //   ),
                      //   width: MediaQuery.of(context).size.width,
                      //   child: TextButton(
                      //       onPressed: () => provider.loginPinPage(),
                      //       child: const Image(image: AssetImage('assets/fingerprint.png'))
                      //   ),
                      // ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(0.0)),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Semantics(
                          label: "jika kamu mau masuk dengan fingerprint pilih ini",
                          child: TextButton(
                              onPressed: () async {
                                if (!_isAuthenticated){
                                  final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
                                  if(canAuthenticateWithBiometrics) {
                                    try{
                                      final bool didAuthenthicate = await _auth.authenticate(
                                          localizedReason: "Please Authenthicate So We Can Log you In",
                                          options: const AuthenticationOptions(
                                            biometricOnly: true,
                                          ));
                                      setState(() {
                                        _isAuthenticated = didAuthenthicate;
                                      });
                                      provider.navigationPage();
                                    } catch(e) {print (e);}
                                  }
                                }else{
                                  setState(() {
                                    _isAuthenticated = false;
                                  });
                                }

                              },
                              child: const Image(image: AssetImage('assets/fingerprint.png'))
                          ),
                        ),
                      ),
                      // const SizedBox(height: 206),
                    ],
                  )
                 ),
              ]
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
