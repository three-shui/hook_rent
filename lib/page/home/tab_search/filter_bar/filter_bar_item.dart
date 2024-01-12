import 'package:flutter/material.dart';

class FilterBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function(BuildContext) onTap;

  const FilterBarItem(
      {required this.title,
      required this.isActive,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Colors.green : Colors.black;

    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: Row(
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 17)),
          Icon(
            isActive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: color,
          )
        ],
      ),
    );
  }
}
