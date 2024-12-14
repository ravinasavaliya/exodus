import 'package:exodus/screens/bottom_bar.dart';
import 'package:exodus/screens/onBoarding/onbording_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/prefnce_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String isLogin = PreferenceManager.getIsLogin() ?? 'false';
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      isLogin == 'true' ? Get.to(BottomBar()) : Get.to(OnBoardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff1E1F33),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
