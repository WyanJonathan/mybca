import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
import 'package:mybca_prototype/screens/qris/qris_provider.dart';

class PembayaranQrisPage extends StatefulWidget {
  const PembayaranQrisPage({super.key});

  @override
  State<PembayaranQrisPage> createState() => _PembayaranQrisPageState();
}

class _PembayaranQrisPageState extends State<PembayaranQrisPage> {
  @override
  Widget build(BuildContext context) {
    QrisProvider provider = Modular.get<QrisProvider>();
    final watch = context.watch<QrisProvider>();


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Pembayaran QRIS", title4),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 150,
              color: Color(0xFF0060AF),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Pembayaran Ke',
                    style: TextStyle(fontSize: 16, color: Color(0xFF0060AF), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'RM KARI BUNDO',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'TANGERANG, 15349, ID',
                    style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mata Uang',
                    style: TextStyle(fontSize: 16, color: Color(0xFF0060AF), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'IDR',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 2),
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
                          controller: watch.nominalController,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nominal',
                            hintStyle: TextStyle(fontSize: 28, color: Color(0xFF0060AF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => provider.pinPage(watch.nominalController?.text,'RM KARI BUNDO'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0060AF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Lanjut',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}