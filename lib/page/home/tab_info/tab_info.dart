import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info.dart';
import 'package:hook_rent/widgets/search_bar/search_bar.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  State<TabInfo> createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          Info(false),
          Info(false),
        ],
      ),
    );
  }
}
