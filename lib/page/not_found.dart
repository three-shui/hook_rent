import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404"),
      ),
      body: const Center(
        child: Text(
          "The page you visited does not exist ！！！",
          style: TextStyle(color: Colors.red,fontSize: 20),

        ),
      ),
    );
  }
}
