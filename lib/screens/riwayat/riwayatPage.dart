import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class riwayatPage extends StatefulWidget {
  const riwayatPage({super.key});

  @override
  State<riwayatPage> createState() => _riwayatPageState();
}

class _riwayatPageState extends State<riwayatPage> {
  @override
  Widget build(BuildContext context) {
    RiwayatProvider provider = Modular.get<RiwayatProvider>();
    final read = context.read<RiwayatProvider>();
    final watch = context.watch<RiwayatProvider>();

    const String norek = "123-456-789";

    final List<String> entries = <String>['05/25 CELINE DAVINA TRSF E-BANKING CR', 'TRANSFER KE 201 REGINE HA M-BCA BI-FAST DB', '05/12 ADI KRESNA TRSF E-BANKING CR', '05/04 RAHMA SARI TRSF E-BANKING CR',  '05/02 PAK STANLEY A M TRSF E-BANKING CR', '05/25 ZAHID TRSF E-BANKING CR','05/25 CELINE DAVINA TRSF E-BANKING CR'];
    final List<String> jumlah = <String>['150.000,00', '250.000,00', '390.000,00', '50.000,00','250.000,00', '390.000,00', '50.000,00' ];
    final List<String> bulan = <String>['Mei','Mei','Mei','Mei','Mei','Mei','Mei'];
    final List<int> date = <int>[31,28,22,18,09,05,02];
    final List<int> status = <int>[1,0,1,1,0,1,0];

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: widgetFont("Riwayat", title4)
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
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
                              widgetFont("${norek}", jumbo2),
                              widgetFont("Paspor BCA GPN Xpresi", title2)
                            ],
                          ),
                          IconButton(
                            onPressed: () => {
                                Clipboard.setData(ClipboardData(text: norek))
                                    .then((value) { Asuka.showSnackBar(SnackBar(content: Text("Nomor Rekening Telah Di Salin"))); // -> show a notification
                                 })
                                },
                              icon: const Icon(Icons.copy, size: 40,)
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.riwayatPage2(),
                          child: widgetFont('Pilih Periode Mutasi', jumbo1)),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Color(0xFFD4D4D4),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: widgetFont("Terbaru", blue2),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                color: Colors.white,
                child: ListView.builder(
                    // shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFB1B1B1),
                              width: 1.0,
                            ),
                          ),
                        ),
                        // height: 80,
                        // color: Colors.amber[colorCodes[index]],
                        child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: Center(
                                    child: Column(
                                      children: [
                                        Text("${date[index]}", style: const TextStyle(color: Color(0xFF6A6A6A), fontSize: 35, fontWeight: FontWeight.bold)),
                                        Text(bulan[index],  style: const TextStyle(color: Color(0xFF6A6A6A), fontSize: 23, fontWeight: FontWeight.bold)),
                                      ],
                                    ))),
                              Container(
                                width: MediaQuery.of(context).size.width*0.7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${entries[index]}',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        softWrap: true),
                                    (status[index] == 1)
                                        ?Text('${jumlah[index]}', style: TextStyle(color: Color(0xFF0085FF),fontSize: 17),)
                                        : Text('${jumlah[index]}', style: TextStyle(color: Color(0xFFFF0000),fontSize: 17, ),)
                                  ],
                                ),
                              ),

                            ]),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
