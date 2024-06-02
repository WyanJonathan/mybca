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
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(LoginProvider.new);
    i.addSingleton(HomeProvider.new);
    i.addSingleton(RiwayatProvider.new);
    i.addSingleton(ProfileProvider.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const Login(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/loginPinPage', child: (context) => const LoginPinPage(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/home', child: (context) => const Home(title: '',), transition: TransitionType.rightToLeftWithFade);
    r.child('/navigationPage', child: (context) => navigationPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/notificationPage', child: (context) => notificationPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage', child: (context) => riwayatPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage2', child: (context) => riwayatPage2(), transition: TransitionType.rightToLeftWithFade);
    r.child('/riwayatPage3', child: (context) => riwayatPage3(), transition: TransitionType.rightToLeftWithFade);
    r.child('/profile', child: (context) => Profile(title: '',), transition: TransitionType.rightToLeftWithFade);

  }
}
