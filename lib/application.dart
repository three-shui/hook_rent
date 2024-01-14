import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_rent/routes.dart';
import 'package:hook_rent/scoped_model/auth_model.dart';
import 'package:hook_rent/scoped_model/city_model.dart';
import 'package:hook_rent/scoped_model/filter_bar_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.defineRoutes(router);
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: ScopedModel<CityModel>(
          model: CityModel(),
          child: ScopedModel<FilterBarModel>(
            model: FilterBarModel(),
            child: MaterialApp(
              theme: ThemeData(primarySwatch: Colors.green),
              onGenerateRoute: router.generator,
            ),
          ),
        ));
  }
}
