import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bank_app/pages/login_pages/login_page.dart';

// import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Scene()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // splashT7L (38:154)
      padding: EdgeInsets.fromLTRB(86, 302, 86, 283),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // banklogo1gEz (311:25)
            margin: EdgeInsets.fromLTRB(21, 0, 0, 15),
            width: 167,
            height: 195,
            child: Image.asset(
              'images/bank_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // group2NtW (38:156)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Align(
              // rectangle2KYr (38:158)
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 112,
                height: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff344e41),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
