import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class TransferPage4 extends StatefulWidget {
  const TransferPage4({super.key});

  @override
  State<TransferPage4> createState() => _TransferPage4State();
}

class _TransferPage4State extends State<TransferPage4> {

  @override
  Widget build(BuildContext context) {
    TransferProvider provider = Modular.get<TransferProvider>();
    final read = context.read<TransferProvider>();
    final watch = context.watch<TransferProvider>();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      widgetFont("Cari Tujuan Transfer", jumbo2),
                      Container(
                        // width: MediaQuery.of(context).size.width*0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 6),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: -5.0,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
                          keyboardType: TextInputType.number,
                          controller: watch.nominalController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nominal',
                              hintStyle: TextStyle(fontSize: 28, color: Color(0xFF0060AF))
                          ),
                          onChanged: (text) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff1e5fad),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: widgetFont('Lanjut', jumbo1)),
            ),
          ],
        ),
      ),
    );
  }
}
