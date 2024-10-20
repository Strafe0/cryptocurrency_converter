import 'package:cryptocurrency_converter/data/services/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<bool> authenticateUser(String login, String password) async {
    if (login == 'demo' && password == 'demo') {
      return Future.value(true);
    }

    return Future.value(false);
  }
}
