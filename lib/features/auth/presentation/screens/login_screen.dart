import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/core/data_state.dart';
import 'package:moexfilm/features/auth/presentation/widgets/google_button.dart';
import 'package:moexfilm/features/auth/providers/auth_provider.dart';
import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:moexfilm/features/auth/services/auth_service_supabase.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String path = "/";
  static const String name = "Login";
  final authServiceProvider = Provider<AuthService>((ref) => AuthServiceSupabase());

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    supabase.Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      print("Algo paso:"+event.toString());
    });

    final authNotifier = StateNotifierProvider<AuthProvider, DataState>(
        (ref) => AuthProvider(ref.read(authServiceProvider)));
    final authState = ref.watch(authNotifier);

    _handleLogin() {
      ref.read(authNotifier.notifier).loginWithGoogle();
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 60),
        Text(
          "Moexfilm",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 400,
          width: 400,
          child: Lottie.network(
              "https://assets3.lottiefiles.com/packages/lf20_wX69nA.json"),
        ),
        SizedBox(height: 120),
        GoogleButton(onPressed: () {
          _handleLogin();
        })
      ],
    )));
  }
}
