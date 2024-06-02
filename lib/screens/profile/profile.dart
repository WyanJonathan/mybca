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

  @override
  Widget build(BuildContext context) {
    ProfileProvider provider = Modular.get<ProfileProvider>();
    final read = context.read<ProfileProvider>();
    final watch = context.watch<ProfileProvider>();
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const SizedBox(
            child : Image(image : AssetImage('assets/logobca.png'))
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
                      child: Image(image : AssetImage('assets/black_card_bca.png'),
                        width: 1500,),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: widgetFont('Lihat Detail Kartu', jumbo2)),
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
                              widgetFont("Card Number", normal1),
                              widgetFont("${watch.norek}", jumbo3),
                            ],
                          ),
                          IconButton(
                              onPressed: () => {
                                Clipboard.setData(ClipboardData(text: watch.norek))
                                    .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Rekening Telah Di Salin"))); // -> show a notification
                                })
                              },
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
                    const SizedBox(height: 87,),
                  ],
                )
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
