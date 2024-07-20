import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
// we only added this page just so the file could be run, but we haven't added anything into the feature
class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        // color: Theme.of(context).colorScheme.primary,
        child: widgetFont("Notification Page", title1)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
