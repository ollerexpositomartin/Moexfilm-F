import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:moexfilm/core/exceptions/exceptions.dart';

class AuthServiceSupabase implements AuthService {
  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
  }

  @override
  Future<void> loginWithGoogle() async {
    bool logged =
        await Supabase.instance.client.auth.signInWithOAuth(Provider.google);
    if (!logged) {
      throw LoginException("No logged with google");
    }
  }

  @override
  Future<void> register(
      String email, String password, String passwordConfirmed) async {
    // TODO: implement register
  }
}
