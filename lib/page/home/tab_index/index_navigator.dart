import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_index/index_navigator_item.dart';
import 'package:hook_rent/widgets/common_image.dart';

class IndexNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map((item) => InkWell(
                    onTap: () => item.onTap(context),
                    child: Column(
                      children: [
                        CommonImage(item.imageUrl,width: 50),
                        Text(item.title),
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
