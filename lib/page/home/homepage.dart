import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_index/index.dart';
import 'package:hook_rent/page/home/tab_info/tab_info.dart';
import 'package:hook_rent/page/home/tab_profile/tab_profile.dart';
import 'package:hook_rent/page/home/tab_search/tab_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabViewList = [
    const TabIndex(),
    const TabSearch(),
    const TabInfo(),
    const TabProfile(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
    const BottomNavigationBarItem(icon: Icon(Icons.info), label: '资讯'),
    const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabViewList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
