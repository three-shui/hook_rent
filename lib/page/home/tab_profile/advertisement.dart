import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/common_image.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: const CommonImage(
          "https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg"),
    );
  }
}
