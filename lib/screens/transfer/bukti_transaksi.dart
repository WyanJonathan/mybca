import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class buktiTransfer extends StatefulWidget {
  const buktiTransfer({super.key});

  @override
  State<buktiTransfer> createState() => _buktiTransferState();
}

class _buktiTransferState extends State<buktiTransfer> {
  Map<String, dynamic>  detail = Modular.args.data;
  String date = DateFormat("dd MMMM yyyy HH:MM:s").format(DateTime.now());
  TransferProvider provider = Modular.get<TransferProvider>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            // padding: EdgeInsets.zero,
            children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Semantics(
                  label: "Kembali ke Beranda",
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 40),
                    onPressed: () => provider.backHome(),
                  ),
                ),
                // SizedBox(height:MediaQuery.of(context).size.height*0.0003),
                Center(
                  child: Semantics(
                    label: "Logo BCA",
                    enabled: false,
                    child: const SizedBox(
                        child : Image(image : AssetImage('assets/logobca2.png'), height: 50,)
                    ),
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Row(
                children: List.generate(150~/2, (index) => Expanded(
                  child: Container(
                    color: index%2==0?Colors.transparent
                        :Colors.grey,
                    height: 2,
                  ),
                )),
              ),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image : AssetImage('assets/bukti_transaksi.png'), height: 90,),
                      SizedBox(height:MediaQuery.of(context).size.height*0.02),
                      widgetFont("Pembayaran Berhasil", jumbo2),
                      widgetFont("IDR ${detail['jumlah']}", jumbo6),
                    ],
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.01),
                Row(
                  children: List.generate(150~/2, (index) => Expanded(
                    child: Container(
                      color: index%2==0?Colors.transparent
                          :Colors.grey,
                      height: 2,
                    ),
                  )),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                widgetFont("Detail Transaksi", jumbo2),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                widgetFont("Tanggal Transaksi", title2),
                widgetFont(date, jumbo2),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                widgetFont("Pembayaran Ke", title2),
                widgetFont("${detail['name']}", jumbo2),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                widgetFont("Total Bayar", title2),
                widgetFont("${detail['jumlah']}", jumbo2),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                widgetFont("No Referensi", title2),
                widgetFont("123456789", jumbo2),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff1e5fad),
                  ),
                  child: TextButton(
                      onPressed: () => provider.home(),
                      child: widgetFont('Selesai', jumbo1)),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.03),
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}
