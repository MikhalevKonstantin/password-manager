import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:password_manager/ui/screens/generate_password/generate_password.dart';
import 'package:password_manager/ui/screens/password_check/password_check.dart';
import 'package:password_manager/ui/screens/passwords/passwords.dart';
import 'package:password_manager/ui/screens/settings/settings.dart';
import 'package:password_manager/ui/theme/color_theme.dart';

class MainOff extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainOff> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Passwords(),
    GeneratePassword(),
    PasswordCheck(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorPalette.ce5e5e5,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPalette.white,
          unselectedItemColor: Color(0x66101010),
          selectedItemColor: Color(0xFF101010),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_icons/list.svg',
                    color: _selectedIndex == 0
                        ? ColorPalette.c53c1fc
                        : ColorPalette.cBABEC7),
                label: '1'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_icons/locker.svg',
                    color: _selectedIndex == 1
                        ? ColorPalette.c53c1fc
                        : ColorPalette.cBABEC7),
                label: '2'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_icons/shield.svg',
                    color: _selectedIndex == 2
                        ? ColorPalette.c53c1fc
                        : ColorPalette.cBABEC7),
                label: '3'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg_icons/calendar.svg',
                    color: _selectedIndex == 3
                        ? ColorPalette.c53c1fc
                        : ColorPalette.cBABEC7),
                label: '4'),
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
