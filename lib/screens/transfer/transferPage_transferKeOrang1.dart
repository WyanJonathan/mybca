import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

//this file is dedicated for the users to input the details of to whom are they going to transfer too


class TransferPage3 extends StatefulWidget {
  const TransferPage3({super.key});

  @override
  State<TransferPage3> createState() => _TransferPage3State();
}

class _TransferPage3State extends State<TransferPage3> {

  Map<String, dynamic>  detail = Modular.args.data;

  List<bool> isSelected = [true, false, false];
  List<String> text = ["SEKARANG", "ATUR TANGGAL", "BERKALA"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    TransferProvider provider = Modular.get<TransferProvider>(); //this line helps the file to connect to the provider, especially if you want to do routing
    final watch = context.watch<TransferProvider>(); // this line helps so that when the developer wants to show something to the user, they can take data from the provider using the alias "watch..{...}"
    final read = context.read<TransferProvider>();// this line helps so that when they want user to input something and save the input, they need to use the alias "read.{...}"

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Transfer Antar BCA", title4),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
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
                        Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                            label: "Ini adalah nomor rekening ${detail['name']}",
                            child: widgetFont("${detail['norek']}", title2)),
                        SizedBox(height: 20,),
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
                        Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
                            label: "Untuk melakukan transfer bisa dipilih dari 3 mode yaitu sekarang, atur tanggal dan transfer secara berkala",
                            child: widgetFont("Jenis Transfer", title6)),
                        Ink(
                          // width: 150,
                          height: MediaQuery.of(context).size.height*0.27,
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
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
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
      ),
    );
  }
}
