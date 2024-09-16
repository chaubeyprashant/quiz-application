// presentation/bloc/auth_event.dart
part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GoogleLoginEvent extends AuthEvent {}

class EmailLoginEvent extends AuthEvent {
  final String email;
  final String password;

  EmailLoginEvent(this.email, this.password);
}

class LogoutEvent extends AuthEvent {}

class AuthGoogleSignInEvent extends AuthEvent {}

class AuthInitialEvent extends AuthEvent {}  // Add this event
