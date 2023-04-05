import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://veplbweymcfyesluztaz.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlcGxid2V5bWNmeWVzbHV6dGF6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY2ODE5NjI2NSwiZXhwIjoxOTgzNzcyMjY1fQ.3tNXA9ZL8nnKu2tJpsKn4mhw9gD1H2TB1A7CofNJp_8",
      debug: true);
  runApp(ProviderScope(child: MoexfilmApp()));
}
