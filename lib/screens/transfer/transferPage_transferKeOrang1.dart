import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class TransferPage3 extends StatefulWidget {
  const TransferPage3({super.key});

  @override
  State<TransferPage3> createState() => _TransferPage3State();
}

class _TransferPage3State extends State<TransferPage3> {

  Map<String, dynamic>  detail = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    RiwayatProvider provider = Modular.get<RiwayatProvider>();
    final read = context.read<RiwayatProvider>();
    final watch = context.watch<RiwayatProvider>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Transfer Antar BCA", title4),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Color(0xFF0060AF),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
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
                      widgetFont("Pembayaran Ke", normal3),
                      widgetFont("${detail['name']}", jumbo2),
                      widgetFont("${detail['norek']}", title2),

                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff1e5fad),
                        ),
                        child: TextButton(
                            onPressed: () => provider.riwayatPage2(),
                            child: widgetFont('Lanjut', jumbo1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
