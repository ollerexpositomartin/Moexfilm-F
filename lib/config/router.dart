import 'package:go_router/go_router.dart';
import 'package:moexfilm/features/features.dart';
import 'package:moexfilm/features/home/presentation/screens/home_screen.dart';


final router = GoRouter(routes: [
  GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context,state) => LoginScreen()),
  GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context,state) => HomeScreen())
],
  redirect: (context,state) {
  String goPage = state.subloc;

  if(goPage.isEmpty){
    return "/";
  }

  }
);
