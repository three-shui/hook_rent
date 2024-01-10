import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  final String? label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixText;
  final String? hitText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem(
      {this.label,
      this.contentBuilder,
      this.suffix,
      this.suffixText,
      this.hitText,
      this.onChanged,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border(
          //取主题颜色
          bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(label!, style: TextStyle(fontSize: 17)),
          ),
          Expanded(
            child: contentBuilder != null
                ? contentBuilder!(context)
                : TextField(
                    decoration: InputDecoration(
                      hintText: hitText,
                      border: InputBorder.none,
                    ),
                    controller: controller,
                  ),
          ),
          if (suffix != null) suffix!,
          if (suffix == null && suffixText != null) Text(suffixText!),
        ],
      ),
    );
  }
}
