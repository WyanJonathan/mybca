import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/login/login_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';


class LoginPinPage extends StatefulWidget {
  const LoginPinPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPinPage> createState() => _LoginPinPageState();
}

class _LoginPinPageState extends State<LoginPinPage> {
  String pin_user = "Abcde1";
  final _formKey = GlobalKey<FormState>();
  LoginProvider provider = Modular.get<LoginProvider>();
  late bool _passwordVisible;

  final TextEditingController _userPasswordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
          backgroundColor: Color(0xFF0060AF),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Semantics(
            label: "Ini adalah halaman untuk kamu memasukkan Pin",
            enabled: false,
            child: widgetFont("Pin", title4))
      ),
      body: Container(
        color: Colors.white,//.of(context).colorScheme.primary,
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
                    const SizedBox(height: 30),

                    // Container(
                    //   height: MediaQuery.of(context).size.height*0.71,
                    //   child: PinCodeWidget(
                    //     minPinLength: 4,
                    //     maxPinLength: 6,
                    //     onChangedPin: (pin) {
                    //       // check the PIN length and check different PINs with 4,5.. length.
                    //     },
                    //     onEnter: (pin, _) {
                    //       if (pin == pin_user){
                    //         asuka.AsukaSnackbar.success("Success").show();
                    //       }else{
                    //         Asuka.showDialog(
                    //           builder: (context) => AlertDialog(
                    //             title: const Text('WARNING'),
                    //             content: const Text('Pin Salah'),
                    //             actions: [
                    //               // TextButton(
                    //               //   onPressed: () {
                    //               //     Navigator.pop(context);
                    //               //   },
                    //               //   child: const Text('Cancel'),
                    //               // ),
                    //               TextButton(
                    //                 onPressed: () {
                    //                   Navigator.pop(context);
                    //                 },
                    //                 child: const Text('Ok'),
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //         pin.isEmpty;
                    //       }
                    //       // callback user pressed enter
                    //     },
                    //     buttonColor: const Color(0xffD9D9D9),
                    //     numbersStyle: const TextStyle(color: Colors.black, fontSize: 25),
                    //     // centerBottomWidget: IconButton(
                    //     //   icon: const Icon(
                    //     //     Icons.fingerprint,
                    //     //     size: 40,
                    //     //   ),
                    //     //   onPressed: () {},
                    //     // ),
                    //   ),
                    // ),

                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(child: widgetFont("Masukkan Pin Kamu", title1)),
                          TextFormField(
                              autofocus: true,
                              controller: _userPasswordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                // Here is key idea
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value == pin_user) {
                                asuka.AsukaSnackbar.success("Success").show();
                                provider.navigationPage();
                              } else {
                                setState(() {
                                  _userPasswordController.clear();
                                });
                                return 'Incorrect Pin';
                              };
                            }
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF0060AF),
                                    ),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(content: Text('Processing Data')),
                                    // );
                                  }
                                },
                                child: Semantics(
                                    label: "Kirim pin yang sudah kamu masukkan",
                                    child: Text("Kirim", style : TextStyle(fontSize: 23, color: Colors.white),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.5),
                    Center(
                      child: Container(
                        child: TextButton(
                          onPressed: () {},
                          child: widgetFont("Lupa Pin?", blue)),
                      ),
                    ),
                    // SizedBox(height: 10,),
                  ],
                )
              ),
              ]
            ),
          ],
        ),
      )
    );
  }
}
