import 'package:flutter/material.dart';

// 스플래시 화면. splashDelay 시간 이후에 홈으로 이동

const int splashDelay = 2;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "/splash";

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: splashDelay), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: const Material(
        color: Colors.indigo,
        child: SafeArea(
          child: Center(
            child: Text(
              'Splash',
              style: TextStyle(fontSize: 32, color: Colors.white)
            )
          )
        )
      )
    );
  }
}