abstract class AuthService {
  void login(String email, String password);
  void register(String email, String password, String passwordConfirmed);
  void loginWithGoogle();
}
