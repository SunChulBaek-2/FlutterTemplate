import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/detail/product.dart';
import 'package:flutter_template/ui/detail/webview.dart';
import 'package:flutter_template/ui/home/home.dart';
import 'package:flutter_template/ui/splash/splash.dart';
import 'package:go_router/go_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Template',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        splashFactory: InkRipple.splashFactory
      ),
      routerConfig: GoRouter(
        initialLocation: '/splash',
        routes: [
          GoRoute(
            path: '/splash',
            name: SplashScreen.routeName,
            pageBuilder: (context, state) => defaultTransitionPage(
              child: const SplashScreen()
            ),
          ),
          GoRoute(
            path: '/home',
            name: HomeScreen.routeName,
            pageBuilder: (context, state) => defaultTransitionPage(
              child: const HomeScreen(title: 'Flutter Template')
            ),
          ),
          GoRoute(
            path: '/product',
            name: ProductScreen.routeName,
            pageBuilder: (context, state) => defaultTransitionPage(
              child: ProductScreen(param: state.extra as ProductParam)
            ),
          ),
          GoRoute(
            path: '/webview',
            name: WebViewScreen.routeName,
            pageBuilder: (context, state) => defaultTransitionPage(
              child: WebViewScreen(param: state.extra as WebViewParam)
            )
          ),
        ]
      ),
    );
  }

  CustomTransitionPage defaultTransitionPage({ required Widget child }) =>
    CustomTransitionPage(
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child
        );
      }
    );
}