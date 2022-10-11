import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/counter_observer.dart';
import 'package:flutter_template/ui/home/home.dart';

void main() {
  BlocObserver observer = CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Template'),
    );
  }
}
