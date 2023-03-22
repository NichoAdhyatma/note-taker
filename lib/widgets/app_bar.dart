import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 1.0,
            offset: Offset(
              0.0,
              0.5,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo-white.png'),
                    fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
