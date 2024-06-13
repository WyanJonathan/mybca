import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
import 'package:mybca_prototype/screens/qris/qris_provider.dart';


class QrisBayarPage extends StatefulWidget {
  const QrisBayarPage({super.key});

  @override
  State<QrisBayarPage> createState() => _QrisBayarPageState();
}

class _QrisBayarPageState extends State<QrisBayarPage> {

  @override
  Widget build(BuildContext context) {
    QrisProvider provider = Modular.get<QrisProvider>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Bayar Qris", title4),
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
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                  color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff1e5fad),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('USER TESTING1', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 5,),
                            Text('BCA - 300100300', style: TextStyle(fontSize: 20, color: Colors.white),textAlign: TextAlign.center,),
                            SizedBox(height: 20,),
                            Center(
                              child: Container(
                                width: 220,
                                height: 220,
                                color: Colors.white,
                                child: Image.asset('assets/qris-bayar.png'), // Ganti dengan path QR code Anda
                              ),
                            ),
                            SizedBox(height: 20,),
                            Center(
                              child: ElevatedButton(
                                onPressed: () => provider.toPembayaranQRIS(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xff1e5fad),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                ),
                              child: Text('Tambah Detail', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),)
                            ),                   
                          ],
                        )
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 65,
                            child: OutlinedButton(
                              onPressed: () => provider.toQRScannerPage(),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xFF0060AF), width: 4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Bayar',
                                style: TextStyle(fontSize: 20, color:Color(0xFF0060AF), fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 65,
                            child: ElevatedButton(
                              onPressed: () => provider.toPembayaranQRIS(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0060AF),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Transfer',
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ]
              ) 
            ),
          ],
        ),
      ),
    );
  }
}
