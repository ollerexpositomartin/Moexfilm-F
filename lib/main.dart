import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moexfilm/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://veplbweymcfyesluztaz.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlcGxid2V5bWNmeWVzbHV6dGF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgxOTYyNjUsImV4cCI6MTk4Mzc3MjI2NX0.FaU6PbOx7CoYGbxWC5qLKVABjX240tYh1HNuCfNUzNAeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZlcGxid2V5bWNmeWVzbHV6dGF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgxOTYyNjUsImV4cCI6MTk4Mzc3MjI2NX0.FaU6PbOx7CoYGbxWC5qLKVABjX240tYh1HNuCfNUzNA",
  );

  runApp(ProviderScope(child: MoexfilmApp()));
}
