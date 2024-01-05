import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info_item.dart';
import 'package:hook_rent/widgets/common_image.dart';

class InfoWidget extends StatelessWidget {
  final InfoItem item;

  const InfoWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          CommonImage(
            item.imageUrl,
            fit: BoxFit.fill,
            width: 150,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.source,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      item.time,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
