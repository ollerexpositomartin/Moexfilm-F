import 'package:flutter/foundation.dart' show kIsWeb;

abstract class Constants {
  static const String? authRedirect = kIsWeb ? null: 'io.supabase.flutterquickstart://login-callback/';
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue: '',
  );
}