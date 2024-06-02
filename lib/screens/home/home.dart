import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/home/home_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // int _selectedIndex = 1;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Modular.get<HomeProvider>();
    final read = context.read<HomeProvider>();
    final watch = context.watch<HomeProvider>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const SizedBox(
            child : Image(image : AssetImage('assets/logobca.png'))
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(0.0)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      width: 145,
                      color: const Color(0xFFE4EDFF),
                      child: Row(
                        children: [
                          widgetFont(" HALO", title1),
                          widgetFont(" USER1", blue),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        const Image(image : AssetImage('assets/bg_kartu_home.png'),
                          width: 1000,),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widgetFont("Total Saldo", jumbo1),
                              widgetFont("Rekening 0943-XXX-XXX", orange),
                              SizedBox(height: 70,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                read.obscure
                                  ? widgetFont("IDR *******", title3)
                                  : widgetFont("IDR 354.000", title3),
                                  IconButton(
                                    icon: watch.obscure
                                        ? const Icon(Icons.remove_red_eye, color: Colors.white,)
                                        : const Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
                                    onPressed: () => watch.obscure
                                        ? read.obscure = false
                                        : read.obscure = true,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            color: Color(0xFF0060AF),
                          ),
                          child: TextButton(
                              onPressed: () => provider.riwayatPage(),
                              child: Column(
                                children: [
                                  const Icon(Icons.history_rounded, color: Colors.white, size: 100,),
                                  widgetFont("  Riwayat  ", jumbo1)
                                ],
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            color: Color(0xFF0060AF),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Transform.rotate(
                                    angle: 45 * math.pi / 180,
                                    child: const IconButton(
                                      icon: Icon(
                                        Icons.swap_vert_rounded,
                                        color: Colors.white,
                                        size: 84,
                                      ),
                                      onPressed: null,
                                    ),
                                  ),
                                  // const Icon(Icons.swap_vert_rounded, color: Colors.white, size: 100,),
                                  widgetFont("  Transfer  ", jumbo1)
                                ],
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            color: Color(0xFF0060AF),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  // const Icon(Icons.qr_code, color: Colors.white, size: 100,),
                                  const Icon(CupertinoIcons.qrcode, color: Colors.white, size: 100,),
                                  widgetFont("    QRIS     ", jumbo1)
                                ],
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            color: Color(0xFF0060AF),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Column(
                                children: [
                                  const Icon(CupertinoIcons.square_grid_2x2_fill, color: Colors.white, size: 100,),
                                  widgetFont("   Lainnya  ", jumbo1)
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 68,),
                  ],
                )
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Notification',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );

  }
}
