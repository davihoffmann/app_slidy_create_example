import 'package:app_slidy_create/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final controller = Modular.get<AuthController>();

  @observable
  bool isLoading = false;

  @action
  Future loginWithGoogle() async {
    try {
      isLoading = true;
      await controller.loginWithGoogle();
      Modular.to.pushReplacementNamed('/tasks');
      isLoading = false;
    } catch(e) {
      print(e);
      isLoading = false;
    }
  }

  
}
