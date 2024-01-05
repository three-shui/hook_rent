import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_index/index_recommend_data.dart';

import 'index_recommend_item.dart';

class IndexRecommend extends StatelessWidget {
  const IndexRecommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[100],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("房屋推荐",style: TextStyle(fontWeight: FontWeight.w600)),
              Text("更多",style: TextStyle(color: Colors.grey[700])),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: datas.map((data) => IndexRecommendItem(data)).toList(),
          )
        ],
      ),
    );
  }
}
