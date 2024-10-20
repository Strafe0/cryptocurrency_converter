import 'package:cryptocurrency_converter/data/services/auth/auth_service.dart';

class LoginUser {
  LoginUser(this._authService);

  final AuthService _authService;

  Future<bool> call(String login, String password) async {
    return _authService.authenticateUser(login, password);
  }
}
