import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color fontColor;
  final Color? bgColor;

  const CommonTag.origin(this.title,
      {Key? key, this.fontColor = Colors.blue, this.bgColor = Colors.grey})
      : super(key: key);

  factory CommonTag(String title) {
    switch (title) {
      case "近地铁":
        return CommonTag.origin(
          title,
          fontColor: Colors.red,
          bgColor: Colors.red[50],
        );
      case "随时看房":
        return CommonTag.origin(
          title,
          fontColor: Colors.green,
          bgColor: Colors.green[50],
        );
      case "集中供暖":
        return CommonTag.origin(
          title,
          fontColor: Colors.purple,
          bgColor: Colors.purple[50],
        );
      case "新上":
        return CommonTag.origin(
          title,
          fontColor: Colors.lightBlue,
          bgColor: Colors.lightBlue[50],
        );
      default:
        return CommonTag.origin(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Text(
        title,
        style: TextStyle(color: fontColor, fontSize: 13),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
