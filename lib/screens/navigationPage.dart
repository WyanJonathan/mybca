import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybca_prototype/screens/home/home.dart';
import 'package:mybca_prototype/screens/login/loginPin.dart';
import 'package:mybca_prototype/screens/notificationPage.dart';
import 'package:mybca_prototype/screens/profile/profile.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


// class navigationPage extends StatelessWidget {
//   PersistentTabController _controller = PersistentTabController(initialIndex: 1); //default 0
//
//   List<Widget> _buildScreens() {
//     return [
//       notificationPage(),
//       Home(title: '',),
//       Profile(title: ''),
//     ];
//   }
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.bell),
//         // title: ("Notification"),
//         activeColorPrimary: CupertinoColors.white,
//         inactiveColorPrimary: CupertinoColors.inactiveGray,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.home),
//         // title: ("Home"),
//         activeColorPrimary: CupertinoColors.white,
//         inactiveColorPrimary: CupertinoColors.inactiveGray,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.person),
//         // title: ("Profile"),
//         activeColorPrimary: CupertinoColors.white,
//         inactiveColorPrimary: CupertinoColors.inactiveGray,
//       ),
//     ];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: const Color(0xFF0060AF), // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
//     );
//   }
// }


/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const navigationPage());

class navigationPage extends StatelessWidget {
  const navigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    notificationPage(),
    Home(title: '',),
    Profile(title: ''),
    // Text(
    //   'Index 0: Notification',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 1: Home',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 2: Profile',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0060AF),
        title: Semantics(
          label: "Logo BCA",
          enabled: false,
          child: const SizedBox(
              child : Image(image : AssetImage('assets/logobca.png'))
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          // boxShadow: [
          // BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          //  ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.bell),
                      label: 'Notification',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person),
                      label: 'Profile',
                    ),
                  ],
                  backgroundColor:Color(0xFF0060AF),
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.white,
                  onTap: _onItemTapped,
                ),
          ),
      ),
    );
  }
}


