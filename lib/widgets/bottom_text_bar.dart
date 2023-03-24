import 'package:flutter/material.dart';
import '../constants/theme.dart';

class BottomTextBar extends StatelessWidget {
  const BottomTextBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.only(left: 70, right: 70, bottom: 50),
      decoration: const BoxDecoration(
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon-text-A.png'))),
            ),
            label: 'ABC',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/icon-hamburger-list.png'))),
            ),
            label: 'Tes',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon-check-list.png'))),
            ),
            label: 'Tes2',
          ),
        ],
      ),
    );
  }
}
