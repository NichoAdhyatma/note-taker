import 'dart:ui';
import '../constants/theme.dart';
import 'package:flutter/material.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          width: 50,
          margin: EdgeInsets.only(left: 70, right: 70, bottom: 50),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/icon-text-A.png'))
                  ),
                ),
                label: 'ABC',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/icon-hamburger-list.png'))
                  ),
                ),
                label: 'Tes',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/icon-check-list.png'))
                  ),
                ),
                label: 'Tes2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
