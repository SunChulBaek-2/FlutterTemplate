import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/home.dart';
import 'package:go_router/go_router.dart';

// 스플래시 화면. splashDelay 시간 이후에 홈으로 이동

const int splashDelay = 2;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "/splash";

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  late Future move;

  @override
  void initState() {
    super.initState();
    move = Future.delayed(const Duration(seconds: splashDelay), () {
      context.goNamed(HomeScreen.routeName);
    });
  }

  @override
  void dispose() {
    move.ignore();
    super.dispose();
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