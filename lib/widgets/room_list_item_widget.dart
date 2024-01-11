import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_search/room_list_item_data.dart';
import 'package:hook_rent/widgets/common_image.dart';

import 'common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushNamed("roomDetail/${data.id}"),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          children: [
            CommonImage(
              data.imageUrl,
              width: 140,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(data.subTitle, style: TextStyle(color: Colors.grey)),
                  Wrap(children: data.tags.map((tag) => CommonTag(tag)).toList()),
                  Text("${data.price} 元/月",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
