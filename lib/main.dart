import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:moexfilm/config/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: Constants.supabaseUrl,
      anonKey: Constants.supabaseAnnonKey,
      debug: true);
  runApp(ProviderScope(child: MoexfilmApp()));
}
