// presentation/bloc/auth_bloc.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<GoogleLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.signInWithGoogle();
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(AuthError("Failed to login with Google"));
        }
      } catch (e) {
        emit(AuthError("Failed to login: $e"));
      }
    });

    on<EmailLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.signInWithEmail(event.email, event.password);
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(AuthError("Failed to login with Email"));
        }
      } catch (e) {
        emit(AuthError("Failed to login: $e"));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await _authService.signOut();
      emit(AuthInitial());
    });
  }
}
