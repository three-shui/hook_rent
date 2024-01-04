import 'package:flutter/material.dart';
import 'package:hook_rent/routes.dart';

class PageContent extends StatelessWidget {
  final String? name;

  const PageContent({this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("当前页面:$name"),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            child: Text(Routes.home, style: TextStyle(fontSize: 30)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, Routes.login),
            child: Text(Routes.login, style: TextStyle(fontSize: 30)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/aaaaa"),
            child: Text("not found page", style: TextStyle(fontSize: 30)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/room/33"),
            child: Text(Routes.roomDetail, style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
