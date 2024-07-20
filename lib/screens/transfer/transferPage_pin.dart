import 'package:asuka/asuka.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

//this page is dedicated for showing the pin for the transaction

class transferPagePin extends StatefulWidget {
  const transferPagePin({super.key, required this.title});

  final String title;
  @override
  State<transferPagePin> createState() => _transferPagePinState();
}

class _transferPagePinState extends State<transferPagePin> {
  String pin_user = "000000";
  final _formKey = GlobalKey<FormState>();
  TransferProvider provider = Modular.get<TransferProvider>();
  late bool _passwordVisible;

  Map<String, dynamic>  detail = Modular.args.data;

  final TextEditingController _userPasswordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Color(0xFF0060AF),
            title: Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                label: "Ini adalah halaman untuk kamu memasukkan Pin",
                enabled: false,
                child: widgetFont("Pin", title4))
        ),
        body: Container(
          color: Color(0xFFf9f9ff),//.of(context).colorScheme.primary,
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
                          color: Color(0xFFf9f9ff),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              height: MediaQuery.of(context).size.height*0.71,
                              child: PinCodeWidget(
                                minPinLength: 4,
                                maxPinLength: 6,
                                onChangedPin: (pin) {
                                  // check the PIN length and check different PINs with 4,5.. length.
                                },
                                onEnter: (pin, _) {
                                  if (pin == pin_user){
                                    asuka.AsukaSnackbar.success("Transaksi Berhasil").show();
                                    provider.printBuktiTransfer(detail['name'],detail['jumlah']);
                                    // Asuka.showSnackBar(const SnackBar(content: Text("Transaksi Berhasil")));

                                  }else{
                                    Asuka.showDialog(
                                      builder: (context) => AlertDialog(
                                        title: const Text('WARNING'),
                                        content: const Text('Pin Salah'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                    pin.isEmpty;
                                  }
                                  // callback user pressed enter
                                },
                                buttonColor: const Color(0xffD9D9D9),
                                numbersStyle: const TextStyle(color: Colors.black, fontSize: 25),
                                // centerBottomWidget: IconButton(
                                //   icon: const Icon(
                                //     Icons.fingerprint,
                                //     size: 40,
                                //   ),
                                //   onPressed: () {},
                                // ),
                              ),
                            ),
                            // SizedBox(height: MediaQuery.of(context).size.height*0.5),
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
