import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/event/bottom_nav_item_reselect_event.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/detail/product.dart';
import 'package:flutter_template/ui/home/tab1/tab1.dart';
import 'package:flutter_template/ui/home/tab2/tab2.dart';
import 'package:flutter_template/ui/home/tab3/tab3.dart';
import 'package:flutter_template/ui/home/tab4/tab4.dart';
import 'package:go_router/go_router.dart';

class Tab {
  IconData icon;
  IconData activeIcon;
  String? label;
  Widget widget;

  Tab(this.icon, this.activeIcon, this.label, this.widget);
}

// 참고 : https://dopble2k.tistory.com/9
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.title,
    required this.onClickProduct,
    super.key,
  });

  static const routeName = "/home";

  final String title;
  final void Function(BuildContext context, Object param) onClickProduct;

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final EventBus _eventBus = getIt<EventBus>();
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // index에 해당하는 더블탭 이벤트를 받음
  List<Tab> get _tabs => <Tab>[
    Tab(Icons.home_outlined, Icons.home, '탭1', Tab1Page(index: 0, onClickItem: widget.onClickProduct)),
    Tab(Icons.business_outlined, Icons.business, '탭2', const Tab2Page(index: 1)),
    Tab(Icons.school_outlined, Icons.school, '탭3', const Tab3Page(index: 2)),
    Tab(Icons.settings_outlined, Icons.settings, '탭4', const Tab4Page(index: 3))
  ];

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('\'뒤로\' 버튼 한번 더 누르시면 종료됩니다.')));
        return Future.value(false);
      }
      return Future.value(true);
    },
    child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
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
        // 하단탭 선택 시 꿀렁꿀렁한 애니메이션 제거
        type: BottomNavigationBarType.fixed,
        items: _tabs.map((tab) => BottomNavigationBarItem(
          icon: Icon(tab.icon),
          activeIcon: Icon(tab.activeIcon),
          label: tab.label
        )).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) { setState(() {
          if (_selectedIndex == index) {
            _eventBus.fire(BottomNavItemReselectEvent(index));
          } else {
            _selectedIndex = index;
            _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut
            );
          }
        }); },
      )
    )
    );
  }
}