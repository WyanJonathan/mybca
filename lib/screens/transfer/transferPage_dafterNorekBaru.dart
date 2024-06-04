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
  static const List<String> listItems = <String>[
    'Celine',
    'Dofan',
    'Kresna',
    'Rahma',
    'Regine',
    'Pak Stanley',
  ];
  final List<String> jumlah = <String>['11111', '2435423', '456789', '3087534', '567890', '987654'];

  List<String> filteredListItems = listItems;

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
                      widgetFont("Cari Tujuan Transfer", jumbo2),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter a name',
                              ),
                              onChanged: (text) {
                                setState(() {
                                  filteredListItems = listItems.where((item) => item.toLowerCase().contains(text.toLowerCase())).toList();
                                });
                              },
                            ),
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
                            onPressed: () => provider.daftarNorek(),
                            child: widgetFont('Nomor Rekening Baru', jumbo1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              // height: 0,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              color: Colors.white,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      // margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      // decoration: const BoxDecoration(
                      //   border: Border(
                      //     bottom: BorderSide(
                      //       color: Color(0xFFB1B1B1),
                      //       width: 1.0,
                      //     ),
                      //   ),
                      // ),
                      child: (filteredListItems.isNotEmpty)
                          ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: filteredListItems.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense:true,
                              title: TextButton(
                                onPressed: (){

                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(filteredListItems[index], style: TextStyle(fontSize: 24, color: Color(0xFF0060AF), fontWeight: FontWeight.bold),),
                                    Text(jumlah[index],style: TextStyle(fontSize: 20, color: Color(0xFF3D3D3D), fontWeight: FontWeight.bold) ),
                                    SizedBox(height: 30,),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                print('The ${filteredListItems[index]} was selected');
                                // Perform your selection action here
                              },
                            );
                          },
                        ),
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listItems[index],
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              softWrap: true),
                          Text('${jumlah[index]}', style: TextStyle(color: Color(0xFF3D3D3D), fontSize: 20),)
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
