import 'dart:math' as math;
import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/home/home_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

//this file will show the buttons in the home page, but it will be run in the navigationPage.dart page

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    HomeProvider provider = Modular.get<HomeProvider>();
    final read = context.read<HomeProvider>();
    final watch = context.watch<HomeProvider>();

    return Scaffold(
      body: Container(
        color: Colors.white,//Color(0xFF0060AF),
        child: SingleChildScrollView(
          child: Stack(
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
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        color: const Color(0xFFE4EDFF),
                        child: Row(
                          children: [
                            widgetFont(" HALO", title1),
                            Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                label: "ini adalah username kamu",
                                child: widgetFont(" USER1", blue)),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff072B4E),
                                Color(0xff0060AF),
                                Color(0xff63AEEB),
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0,0.0),
                              stops: [0.0, 1.0, 2.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,10,20,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                      label: "Ini adalah nomor rekening kamu, jika kamu ingin menyalinnya bisa menggunakakn tombol salin di sebelah kanan",
                                      child: widgetFont("Rekening 0943-432-124", orange)),
                                  Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                    enabled: true,
                                    label : "Ini adalah tombol untuk menyalin nomor rekening kamu",
                                    child: IconButton(
                                        onPressed: () => {
                                          Clipboard.setData(const ClipboardData(text: '0943-432-124'))
                                              .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Kartu Telah Di Salin"))); // -> show a notification
                                          })
                                        },
                                        icon: const Icon(Icons.copy, size: 30, color: Color(0xFFEFA02A),)
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(height: 0,),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              child: widgetFont("Total Saldo", jumbo1),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,10,20,10),                                  child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                watch.obscure
                                    ? Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                    enabled: false,
                                    label: "Ini adalah total saldo kamu, tetapi masih dalam mode disembunyikan, jika kamu ingin melihatnya, tekan tombol tunjukkan saldo yang ada di sebelah kanan-nya",
                                    child: Text("IDR *******", style: TextStyle(fontSize: 40, color: Colors.white)))
                                    : Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                    label: "Ini adalah total saldo kamu, dalam mode tidak disembunyikan",
                                    child: const Text("IDR 354.000", style: TextStyle(fontSize: 40, color: Colors.white))),
                                Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                                  label: watch.obscure
                                      ? "Ini adalah tombol untuk menunjukkan saldo kamu"
                                      : "Ini adalah tombol untuk menutupi saldo kamu",
                                  child: IconButton(
                                    icon: watch.obscure
                                        ? const Icon(Icons.remove_red_eye, color: Colors.white,)
                                        : const Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
                                    onPressed: () => {watch.obscure
                                        ? {read.obscure = false, SemanticsService.announce("Saldo Kamu IDR 354.000", TextDirection.ltr)} //this line is to make it so when the user reveal the nominal of the account balance, the talkback will voice out the label written
                                        : read.obscure = true,}
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                              color: Color(0xFF0060AF),
                            ),
                            child: TextButton(
                                onPressed: () => provider.riwayatPage(),
                                child: Column(
                                  children: [
                                    const Icon(Icons.history_rounded, color: Colors.white, size: 100,),
                                    widgetFont("  Riwayat  ", jumbo1)
                                  ],
                                )),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01),
                          Container(
                            padding: EdgeInsets.fromLTRB(0,20,0,0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                              color: Color(0xFF0060AF),
                            ),
                            child: TextButton(
                              onPressed: ()  => provider.transferPage(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Image(
                                      image : AssetImage('assets/logo_transfer.png'),
                                      width: 90,),
                                  ),
                                  SizedBox(height: 22,),
                                  // const Icon(Icons.swap_vert_rounded, color: Colors.white, size: 100,),
                                  widgetFont("  Transfer  ", jumbo1)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                              color: Color(0xFF0060AF),
                            ),
                            child: TextButton(
                                onPressed: ()  => provider.qrisPage(),
                                child: Column(
                                  children: [
                                    // const Icon(Icons.qr_code, color: Colors.white, size: 100,),
                                    const Icon(CupertinoIcons.qrcode, color: Colors.white, size: 100,),
                                    widgetFont("    QRIS     ", jumbo1)
                                  ],
                                )),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(13)),
                              color: Color(0xFF0060AF),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Column(
                                  children: [
                                    const Icon(CupertinoIcons.square_grid_2x2_fill, color: Colors.white, size: 100,),
                                    widgetFont("   Lainnya  ", jumbo1)
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );

  }
}
