import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_rent/routes.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.defineRoutes(router);
    return MaterialApp(
      onGenerateRoute: router.generator,
    );
  }
}
