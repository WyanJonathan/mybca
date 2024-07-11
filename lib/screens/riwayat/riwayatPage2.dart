import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class riwayatPage2 extends StatefulWidget {
  const riwayatPage2({super.key});

  @override
  State<riwayatPage2> createState() => _riwayatPage2State();
}

class _riwayatPage2State extends State<riwayatPage2> {
  DateTime? start = DateTime.now();
  DateTime? end = DateTime.now();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    RiwayatProvider provider = Modular.get<RiwayatProvider>();
    final read = context.read<RiwayatProvider>();
    final watch = context.watch<RiwayatProvider>();

    return Scaffold(
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
            title: widgetFont("Riwayat", title4)
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF0060AF),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(0.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      widgetFont("Nomor Rekening", jumbo2),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widgetFont("${watch.norek}", jumbo2),
                                widgetFont("Paspor BCA GPN Xpresi", title2)
                              ],
                            ),
                            IconButton(
                                onPressed: () => {
                                  Clipboard.setData(ClipboardData(text: watch.norek))
                                      .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Rekening Telah Di Salin"))); // -> show a notification
                                  })
                                },
                                icon: const Icon(Icons.copy, size: 40,)
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      widgetFont("Pilih Periode Mutasi", blue2),
                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black45, width: 2),
                          color: Colors.white,
                        ),
                        child: TextButton(
                            onPressed: () => provider.tampilkan(start,end,"MEI"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('MEI 2024', style: TextStyle(fontSize: 25, color: Colors.black)),
                                Text("TAMPILKAN", style: TextStyle(fontSize: 20, color: Color(0xFF0060AF), fontWeight: FontWeight.bold))
                              ],
                            )),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black45, width: 2),
                          color: Colors.white,
                        ),
                        child: TextButton(
                            onPressed: () => provider.tampilkan(start,end,"APRIL"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('APRIL 2024', style: TextStyle(fontSize: 25, color: Colors.black)),
                                Text("TAMPILKAN", style: TextStyle(fontSize: 20, color: Color(0xFF0060AF), fontWeight: FontWeight.bold))
                              ],
                            )),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black45, width: 2),
                          color: Colors.white,
                        ),
                        child: TextButton(
                            onPressed: () => provider.tampilkan(start, end, "MARET"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('MARET 2024', style: TextStyle(fontSize: 25, color: Colors.black)),
                                Text("TAMPILKAN", style: TextStyle(fontSize: 20, color: Color(0xFF0060AF), fontWeight: FontWeight.bold))
                              ],
                            )),
                      ),
                      // SizedBox(height: 15,),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(10)),
                      //     border: Border.all(color: Colors.black45, width: 2),
                      //     color: Colors.white,
                      //   ),
                      //   child: TextButton(
                      //       onPressed: () => provider.riwayatPage3(),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text('PILIH PERIODE LAIN', style: TextStyle(fontSize: 25, color: Color(0xFF093967))),
                      //           Icon(Icons.more_horiz, size: 40,)
                      //         ],
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
