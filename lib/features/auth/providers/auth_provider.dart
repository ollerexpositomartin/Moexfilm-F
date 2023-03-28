import 'package:moexfilm/features/auth/services/auth_service.dart';
import 'package:moexfilm/features/auth/services/auth_service_supabase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:moexfilm/core/data_state.dart';

class AuthProvider extends StateNotifier<DataState> {
  AuthProvider(this._authService) : super(const DataState.initial());

  final AuthService _authService;
}
