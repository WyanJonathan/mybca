import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class TransferPage3 extends StatefulWidget {
  const TransferPage3({super.key});

  @override
  State<TransferPage3> createState() => _TransferPage3State();
}

class _TransferPage3State extends State<TransferPage3> {

  Map<String, dynamic>  detail = Modular.args.data;
  // final List<bool> isSelected = <bool>[true, false, false];

  List<bool> isSelected = [true, false, false];
  List<String> text = ["SEKARANG", "ATUR TANGGAL", "BERKALA"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    TransferProvider provider = Modular.get<TransferProvider>();
    final watch = context.watch<TransferProvider>();
    final read = context.read<TransferProvider>();

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
                      // Row(
                      //   children: [
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       widgetFont("Mata Uang", normal3),
                      //       DropdownMenu(
                      //         label: widgetFont('IDR', normal2),
                      //           controller: watch.mataUang,
                      //         enableSearch: false,
                      //           dropdownMenuEntries: const <DropdownMenuEntry<Color>> [
                      //         DropdownMenuEntry(value: Colors.red, label: "IDR"),
                      //       ]),
                      //     ],
                      //    ),
                      //     SizedBox(width: 20,),
                      //     Container(
                      //       width: MediaQuery.of(context).size.width*0.5,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.blueAccent, width: 6),
                      //         borderRadius: BorderRadius.circular(10),
                      //         boxShadow: const [
                      //           BoxShadow(
                      //             color: Colors.grey,
                      //           ),
                      //           BoxShadow(
                      //             color: Colors.white,
                      //             spreadRadius: -5.0,
                      //             blurRadius: 5.0,
                      //           ),
                      //         ],
                      //       ),
                      //       padding: EdgeInsets.all(10),
                      //       child: TextField(
                      //         style: TextStyle(fontWeight: FontWeight.normal, fontSize: 28),
                      //         keyboardType: TextInputType.number,
                      //         controller: watch.nominalController,
                      //         decoration: InputDecoration(
                      //             border: InputBorder.none,
                      //             hintText: 'Nominal',
                      //             hintStyle: TextStyle(fontSize: 28, color: Color(0xFF0060AF))
                      //         ),
                      //         onChanged: (text) {
                      //           read.nominalController?.text = text;
                      //         },
                      //       ),
                      //     ),
                      //     // widgetFont("Nominal", jumbo2)
                      //   ],
                      // ),
                      widgetFont("Jumlah Uang", title6),
                      SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width,
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
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nominal',
                              hintStyle: TextStyle(fontSize: 28, color: Color(0xFF0060AF))
                          ),
                          onChanged: (text) {
                            read.nominalController?.text = text;
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      widgetFont("Berita Transfer", title6),
                      SizedBox(height: 5,),
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
                          controller: watch.notesController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Catatan',
                              hintStyle: TextStyle(fontSize: 28, color: Color(0xFF0060AF))
                          ),
                          onChanged: (text) {
                            read.notesController?.text = text;
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      // GridView.count(
                      //   primary: true,
                      //   crossAxisCount: 3, //set the number of buttons in a row
                      //   crossAxisSpacing: 8, //set the spacing between the buttons
                      //   childAspectRatio: 1,
                      //   children : [
                      //     ToggleButtons(
                      //     isSelected: isSelected,
                      //     onPressed: (int index) {
                      //       setState(() {
                      //         for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                      //           if (buttonIndex == index) {
                      //             isSelected[buttonIndex] = true;
                      //           } else {
                      //             isSelected[buttonIndex] = false;
                      //           }
                      //         }
                      //       });
                      //     },
                      //     children: <Widget>[
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.blueAccent, width: 6),
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         padding: EdgeInsets.all(10),
                      //         child: widgetFont("SEKARANG", jumbo2)
                      //       ),
                      //       Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.blueAccent, width: 6),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           padding: EdgeInsets.all(10),
                      //           child: widgetFont("SEKARANG", jumbo2)
                      //       ),
                      //       Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.blueAccent, width: 6),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           padding: EdgeInsets.all(10),
                      //           child: widgetFont("SEKARANG", jumbo2)
                      //       ),
                      //
                      //     ],
                      //   ),
                      //   ]
                      // ),
                      widgetFont("Nomor Rekening", title6),
                      Ink(
                        // width: 150,
                        height: MediaQuery.of(context).size.height*0.28,
                        color: Colors.white,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          primary: true,
                          crossAxisCount: 2, //set the number of buttons in a row
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8, //set the spacing between the buttons
                          childAspectRatio: 2, //set the width-to-height ratio of the button,
                          //>1 is a horizontal rectangle
                          children: List.generate(isSelected.length, (index) {
                            //using Inkwell widget to create a button
                            return InkWell(
                                splashColor: Colors.yellow, //the default splashColor is grey
                                onTap: () {
                                  //set the toggle logic
                                  setState(() {
                                    for (int indexBtn = 0;
                                    indexBtn < isSelected.length;
                                    indexBtn++) {
                                      if (indexBtn == index) {
                                        isSelected[indexBtn] = true;
                                      } else {
                                        isSelected[indexBtn] = false;
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueAccent, width: 6),
                                      borderRadius: BorderRadius.circular(10),
                                      color: isSelected[index] ? Color(0xFF0060AF) : Colors.white
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: isSelected[index]
                                        ? Text(text[index], style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                        : Text(text[index], style: TextStyle(fontSize: 23, color: Color(0xFF0060AF), fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ),
                              );
                            }
                          ),
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
                            onPressed: () => provider.pinPage(detail['name'], watch.nominalController?.text),
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
