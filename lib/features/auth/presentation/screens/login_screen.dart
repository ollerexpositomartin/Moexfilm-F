import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/core/data_state.dart';
import 'package:moexfilm/features/auth/presentation/widgets/google_button.dart';
import 'package:moexfilm/features/auth/providers/auth_provider.dart';
import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:moexfilm/features/auth/services/auth_service_supabase.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String path = "/";
  static const String name = "Login";
  final authServiceProvider =
      Provider<AuthService>((ref) => AuthServiceSupabase());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        Container(
          margin: EdgeInsets.all(10),
          width: 350,
          height: 350,
          color: Colors.red,
          child: Text("DIBUJITO"),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: const Text(
            "Your site to see ur content in High Quality",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(height: 120),
        GoogleButton(onPressed: () {
          _handleLogin();
        })
      ],
    )));
  }
}
