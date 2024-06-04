import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/home/home.dart';
import 'package:mybca_prototype/screens/home/home_provider.dart';
import 'package:mybca_prototype/screens/login/login.dart';
import 'package:mybca_prototype/screens/login/login_provider.dart';
import 'package:mybca_prototype/screens/login/loginPin.dart';
import 'package:mybca_prototype/screens/navigationPage.dart';
import 'package:mybca_prototype/screens/notificationPage.dart';
import 'package:mybca_prototype/screens/profile/profile.dart';
import 'package:mybca_prototype/screens/profile/profile_provider.dart';
import 'package:mybca_prototype/screens/riwayat/riwayatPage.dart';
import 'package:mybca_prototype/screens/riwayat/riwayatPage2.dart';
import 'package:mybca_prototype/screens/riwayat/riwayatPage3.dart';
import 'package:mybca_prototype/screens/riwayat/riwayatPage4.dart';
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';
import 'package:mybca_prototype/screens/transfer/transferPage1.dart';
import 'package:mybca_prototype/screens/transfer/transferPage_dafterNorekBaru.dart';
import 'package:mybca_prototype/screens/transfer/transferPage_transferKeBCA.dart';
import 'package:mybca_prototype/screens/transfer/transferPage_transferKeOrang1.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';


class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(LoginProvider.new);
    i.addSingleton(HomeProvider.new);
    i.addSingleton(RiwayatProvider.new);
    i.addSingleton(ProfileProvider.new);
    i.addSingleton(TransferProvider.new);

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const Login(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/loginPinPage', child: (context) => const LoginPinPage(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/home', child: (context) => const Home(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/navigationPage', child: (context) => const navigationPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/notificationPage', child: (context) => const notificationPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage', child: (context) => const riwayatPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage2', child: (context) => const riwayatPage2(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage3', child: (context) => const riwayatPage3(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage4', child: (context) => const riwayatPage4(), transition: TransitionType.rightToLeftWithFade);
    r.child('/profile', child: (context) => const Profile(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/transferPage', child: (context) => const transferPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/transferPage2', child: (context) => const TransferPage2(), transition: TransitionType.rightToLeftWithFade);
    r.child('/transferPage3', child: (context) => const TransferPage3(), transition: TransitionType.rightToLeftWithFade);
    r.child('/transferPage4', child: (context) => const TransferPage4(), transition: TransitionType.rightToLeftWithFade);

  }
}
