import 'package:app_slidy_create/app/modules/login/login_module.dart';
import 'package:app_slidy_create/app/modules/tasks/tasks_module.dart';
import 'package:app_slidy_create/app/pages/splash/splash_page.dart';

import 'pages/splash/splash_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_slidy_create/app/app_widget.dart';
import 'package:app_slidy_create/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (BuildContext context, ModularArguments args) => SplashPage(),
        ),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/tasks', module: TasksModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
