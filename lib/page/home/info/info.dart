import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info_widget.dart';

import 'info_item.dart';

class Info extends StatelessWidget {
  //true:显示   false:不显示
  final bool _showTitle;
  final List<InfoItem> dataList;

  const Info(this._showTitle, {Key? key, this.dataList = infoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _showTitle
              ? Container(
                  padding: EdgeInsets.all(10),
                  child: Text("最新资讯",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  alignment: Alignment.centerLeft,
                )
              : SizedBox(height: 0),
          Column(
            children: dataList.map((info) => InfoWidget(info)).toList(),
          ),
        ],
      ),
    );
  }
}
