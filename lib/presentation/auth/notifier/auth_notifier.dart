import 'package:cryptocurrency_converter/domain/usecases/login_user.dart';
import 'package:cryptocurrency_converter/logger.dart';
import 'package:flutter/foundation.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._loginUser);

  final LoginUser _loginUser;

  bool _authenticated = false;
  bool _authInProgress = false;
  String? _errorMessage;

  bool get authInProgress => _authInProgress;

  bool get authenticated => _authenticated;

  String? get errorMessage => _errorMessage;

  Future<bool> login(String login, String password) async {
    logger.i('Login');

    _authInProgress = true;
    notifyListeners();

    bool result = await _loginUser(login, password);
    _authenticated = result;

    logger.i('Auth result: $result');

    _authInProgress = false;
    notifyListeners();

    return result;
  }

  Future<void> logout() async {
    logger.i('Logout');
    _authenticated = false;
    notifyListeners();
  }
}