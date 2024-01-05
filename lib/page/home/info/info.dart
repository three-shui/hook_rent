import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info_widget.dart';

import 'info_item.dart';

class Info extends StatelessWidget {
  late bool _showTitle;

  Info({Key? key, showTitle = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("最新资讯",style: TextStyle(fontWeight: FontWeight.w600)),
            alignment: Alignment.centerLeft,
          ),

          Column(
            children: infoData.map((info) => InfoWidget(info)).toList(),
          ),
        ],
      ),
    );
  }
}
