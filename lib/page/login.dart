import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/page_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageContent(name: "login"),
    );
  }
}
