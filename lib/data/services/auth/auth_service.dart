abstract class AuthService {
  Future<bool> authenticateUser(String login, String password);
}
