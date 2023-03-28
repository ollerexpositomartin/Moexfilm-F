import 'package:moexfilm/core/exceptions/login_exception.dart';

abstract class AuthService {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String passwordConfirmed);
  Future<void> loginWithGoogle();
}
