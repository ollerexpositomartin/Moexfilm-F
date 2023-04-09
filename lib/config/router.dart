import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moexfilm/features/features.dart';
import 'package:moexfilm/features/home/presentation/screens/home_screen.dart';
import 'package:moexfilm/features/profile/presentation/screens/profile_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final router = GoRouter(
    routes: [
      GoRoute(
          path: LoginScreen.path,
          name: LoginScreen.name,
          builder: (context, state) => LoginScreen()),
      GoRoute(
          path: HomeScreen.path,
          name: HomeScreen.name,
          builder: (context, state) => const Scaffold(body:HomeScreen())),
      GoRoute(
          path: ProfileScreen.path,
          name: ProfileScreen.name,
          builder: (context, state) => const ProfileScreen())
    ],
    redirect: (context, state) {
      String route = state.subloc;

      if (route == '/login' && Supabase.instance.client.auth.currentUser != null) {
        return '/';
      }

      if (Supabase.instance.client.auth.currentUser == null) {
        return "/login";
      }

      if (route.isEmpty) {
        return "/";
      }
    });
