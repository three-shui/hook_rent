import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  String title;
  Function onTap;

  CommonFloatingActionButton({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //这里先写30，后续再优化 TODO
      padding: EdgeInsets.only(left: 30),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(title),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 50.0)),
          //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20.0))
        ),
      ),
    );
  }
}
