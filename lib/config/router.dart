import 'package:go_router/go_router.dart';
import 'package:moexfilm/features/features.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen())
]);
