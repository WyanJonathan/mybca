import 'dart:math' as math;
import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/profile/profile_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String pin_user = "Abcde1";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    ProfileProvider provider = Modular.get<ProfileProvider>();
    final read = context.read<ProfileProvider>();
    final watch = context.watch<ProfileProvider>();
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      widgetFont("Jenis Kartu", normal3),
                      SizedBox(height: 5),
                      Container(
                        width: 270,
                        color: const Color(0xFFE4EDFF),
                        child: widgetFont(" Paspor BCA GPN Xpresi", blue),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image(image : AssetImage('assets/black_card_bca_blur.png'),
                          width: 1500,),
                      ),
                      const SizedBox(height: 10),
                      Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                        enabled: false,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent, width: 6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: widgetFont('Lihat Detail Kartu', jumbo2)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0060AF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(20,10,20,10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widgetFont("Nomor Kartu", normal1),
                                // widgetFont("${watch.nokartu}", jumbo3),
                                widgetFont("**** **** ****", jumbo3),
                              ],
                            ),
                            IconButton(
                                onPressed: () async {
                                  Asuka.showDialog(
                                    builder: (context) => AlertDialog(
                                      title: const Text('Masukkan Kata Sandi Kamu'),
                                      content: Form(
                                        key: _formKey,
                                        child: TextFormField(
                                            autofocus: true,
                                            controller: watch.userPasswordController,
                                            obscureText: !read.passwordVisible,
                                            decoration: InputDecoration(
                                              labelText: 'Kata Sandi',
                                              hintText: 'contoh : AbcdeXX123',
                                              // Here is key idea
                                              // suffixIcon: IconButton(
                                              //   icon: Icon(
                                              //     read.passwordVisible
                                              //         ? Icons.visibility
                                              //         : Icons.visibility_off,
                                              //     color: sTheme.of(context).primaryColorDark,
                                              //   ),
                                              //   onPressed: () {
                                              //     setState(() {
                                              //       read.passwordVisible = !read.passwordVisible;
                                              //     });
                                              //   },
                                              // ),
                                            ),
                                            // The validator receives the text that the user has entered.
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Mohon Diisi';
                                              } else if (value == pin_user) {
                                                Navigator.pop(context);
                                                // asuka.AsukaSnackbar.success("Sukses").show();
                                                Asuka.showModalBottomSheet(
                                                  builder: (context) => Material(
                                                    borderRadius: const BorderRadius.only(
                                                      topLeft: Radius.circular(16),
                                                      topRight: Radius.circular(16),
                                                    ),
                                                    elevation: 7,
                                                    child: SizedBox(
                                                      height: MediaQuery.of(context).size.height*0.5,
                                                      child: ListView(
                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                                        children: [
                                                          ListTile(
                                                            dense:true,
                                                            contentPadding: EdgeInsets.only(left: 0.0,
                                                                right: 0.0),
                                                            title: Row(
                                                              children: [
                                                                SizedBox(width: MediaQuery.of(context).size.width*0.65),
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                                  decoration: BoxDecoration(
                                                                        color: Color(0xFF0060AF),
                                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color: Colors.grey.withOpacity(0.5),
                                                                            spreadRadius: 2,
                                                                            blurRadius: 4,
                                                                            offset: Offset(0, 3), // changes position of shadow
                                                                          ),
                                                                        ],
                                                                      ),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons.close, color: Colors.white,),
                                                                      SizedBox(width: 10,),
                                                                      const Text('Cancel', style: TextStyle(color: Colors.white),),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            onTap: () => Navigator.pop(context),
                                                          ),
                                                          // Container(
                                                          //   width: MediaQuery.of(context).size.width,
                                                          //   height: 90,
                                                          //   // height: MediaQuery.of(context).size.height*0.03,
                                                          //   child: Padding(
                                                          //     padding: const EdgeInsets.symmetric(vertical: 16),
                                                          //     child: ElevatedButton(
                                                          //       style: ElevatedButton.styleFrom(
                                                          //         backgroundColor: Color(0xFF0060AF),
                                                          //       ),
                                                          //       onPressed: () {
                                                          //         Navigator.pop(context);
                                                          //       },
                                                          //       child: const Text("Tutup", style : TextStyle(fontSize: 23, color: Colors.white),)
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.grey.withOpacity(0.5),
                                                                  spreadRadius: 0,
                                                                  blurRadius: 7,
                                                                  offset: Offset(0, 3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: Image(image : AssetImage('assets/black_card_bca.png'),
                                                              width: 1500,),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF0060AF),
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.grey.withOpacity(0.5),
                                                                  spreadRadius: 2,
                                                                  blurRadius: 4,
                                                                  offset: Offset(0, 3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            padding: EdgeInsets.fromLTRB(20,10,20,10),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    widgetFont("Nomor Kartu", normal1),
                                                                    widgetFont("${watch.nokartu}", jumbo3),
                                                                    // widgetFont("**** **** ****", jumbo3),
                                                                  ],
                                                                ),
                                                                IconButton(
                                                                    onPressed: () => {
                                                                      Clipboard.setData(ClipboardData(text: watch.nokartu))
                                                                          .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Kartu Telah Di Salin"))); // -> show a notification
                                                                      })
                                                                    },
                                                                    icon: const Icon(Icons.copy, size: 40, color: Color(0xFF99BFDF),)
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.transparent,
                                                );

                                              } else {
                                                setState(() {
                                                  read.userPasswordController?.clear();
                                                });
                                                return 'Kata Sandi Salah';
                                              };
                                            }
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              // watch.obscure
                                              //     ? read.obscure = false
                                              //     : read.obscure = true;
                                            }
                                            // Navigator.pop(context);
                                          },
                                          child: const Text('Kirim'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                // onPressed: () => {
                                //   Clipboard.setData(ClipboardData(text: watch.nokartu))
                                //       .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Rekening Telah Di Salin"))); // -> show a notification
                                //   })
                                // },
                                icon: const Icon(Icons.copy, size: 40, color: Color(0xFF99BFDF),)
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                color: Color(0xFF0060AF),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      const Icon(Icons.settings, color: Colors.white, size: 35,),
                                      widgetFont("Kontrol", normal4)
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex : 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                color: Color(0xFF0060AF),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      const Icon(Icons.tune, color: Colors.white, size: 35,),
                                      widgetFont("Atur Limit", normal4)
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                color: Color(0xFF0060AF),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      const Icon(Icons.not_interested, color: Colors.white, size: 35,),
                                      widgetFont("Blokir", normal4)
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex : 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                color: Color(0xFF0060AF),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      const Icon(Icons.credit_card, color: Colors.white, size: 35,),
                                      widgetFont("Ganti Kartu", normal4)
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
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
