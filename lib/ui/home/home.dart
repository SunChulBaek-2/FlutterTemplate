import 'package:flutter/material.dart';
import 'package:flutter_template/ui/home/tab1/tab1.dart';
import 'package:flutter_template/ui/home/tab2/tab2.dart';
import 'package:flutter_template/ui/home/tab3/tab3.dart';
import 'package:flutter_template/ui/home/tab4/tab4.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tab {
  IconData icon;
  IconData activeIcon;
  String? label;
  Widget widget;

  Tab(this.icon, this.activeIcon, this.label, this.widget);
}

// 참고 : https://dopble2k.tistory.com/9
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  final List<Tab> _tabs = <Tab>[
    Tab(Icons.home_outlined, Icons.home, '탭1', Tab1Page()),
    Tab(Icons.business_outlined, Icons.business, '탭2', Tab2Page()),
    Tab(Icons.school_outlined, Icons.school, '탭3', Tab3Page()),
    Tab(Icons.settings_outlined, Icons.settings, '탭4', Tab4Page())
  ];

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: '\'뒤로\' 버튼 한번 더 누르시면 종료됩니다.');
        return Future.value(false);
      }
      return Future.value(true);
    }, child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs.map((e) => e.widget).toList(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs.map((tab) => BottomNavigationBarItem(
          icon: Icon(tab.icon),
          activeIcon: Icon(tab.activeIcon),
          label: tab.label
        )).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) { setState(() {
          _selectedIndex = index;
          pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut
          );
        }); },
      )
    )
    );
  }
}