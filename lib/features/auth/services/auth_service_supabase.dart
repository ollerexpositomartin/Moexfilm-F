import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:moexfilm/core/exceptions/exceptions.dart';
import 'package:moexfilm/config/constants.dart';

class AuthServiceSupabase implements AuthService {

  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
  }

  @override
  Future<void> loginWithGoogle() async {
    bool logged = false;
    logged = await Supabase.instance.client.auth
        .signInWithOAuth(Provider.google,redirectTo:Constants.authRedirect);

    if (!logged) {
      throw LoginException("Can`t launch google login");
    }
  }

  @override
  Future<void> register(
      String email, String password, String passwordConfirmed) async {
    // TODO: implement register
  }
}
