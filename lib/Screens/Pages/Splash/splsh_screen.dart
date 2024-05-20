import 'dart:async';
import 'package:flutter/material.dart';

import '../Onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
          () =>
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IntroductionScreens()),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 812,
      decoration: BoxDecoration(
        color: const Color(0xff427d9d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: SizedBox(
              child: Container(

                constraints: const BoxConstraints(
                  maxWidth: 130,
                  minWidth: 34,
                ),

                child: AnimatedSize
                  (duration: const Duration(
                 milliseconds: 80
                ),
                  child: Image.asset("lib/assets/images/s2.png",)),


          )
      ),
      )
    );
  }
}

