import 'package:app_slidy_create/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository _repository = Modular.get();

  @observable
  FirebaseUser user;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(FirebaseUser value) {
    user = value;
    status = user == null ? AuthStatus.logout : AuthStatus.login;
  }

  _AuthControllerBase() {
    _repository.getUser().then(setUser);
  }

  Future loginWithGoogle() async {
    user = await _repository.getGoogleLogin();
  }

  Future logout() async {
    await _repository.logout();
  }

}

enum AuthStatus {
  loading, login, logout
}