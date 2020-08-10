import 'package:app_slidy_create/app/modules/home/home_controller.dart';
import 'package:app_slidy_create/app/modules/home/home_page.dart';
import 'package:app_slidy_create/app/modules/home/repositories/poke_repository.dart';
import 'package:app_slidy_create/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (BuildContext context, ModularArguments args) => HomePage(),
        ),
      ];
}
