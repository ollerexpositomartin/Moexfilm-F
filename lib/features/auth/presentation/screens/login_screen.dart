import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/core/data_state.dart';
import 'package:moexfilm/features/auth/presentation/widgets/custom_button.dart';
import 'package:moexfilm/features/auth/providers/auth_provider.dart';
import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:moexfilm/features/auth/services/auth_service_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../config/app_color.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String path = "/login";
  static const String name = "Login";
  final authServiceProvider =
      Provider<AuthService>((ref) => AuthServiceSupabase());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    supabase.Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      print("Algo paso:" + event.toString());
    });

    final authNotifier = StateNotifierProvider<AuthProvider, DataState>(
        (ref) => AuthProvider(ref.read(authServiceProvider)));

    _handleLogin() {
      ref.read(authNotifier.notifier).loginWithGoogle();
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height / 1.25,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/collage.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            color: AppColors.LAYER_COLOR,
          ),
          Container(
            decoration: const BoxDecoration(
                color: AppColors.BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: height / 2.20,
            width: width,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to\nMoexfilm",
                      style: GoogleFonts.bebasNeue(fontSize: 52),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      " Disfruta de tus películas y series favoritas en cualquier\n momento y lugar. ¡Gracias por elegir Moexfilm para tu\n entretenimiento en línea!",
                      style: TextStyle(fontSize: 15,),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 55),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _handleLogin();
                          },
                          icon: Image.asset("assets/icon_moexfilm.png",
                              height: 32),
                          label: Text("Iniciar Sesión",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 22,
                                  color: AppColors.BACKGROUND_COLOR)),
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(181, 56))),
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
