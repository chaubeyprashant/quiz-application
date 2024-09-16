// presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthError) {
              return Center(child: Text(state.message));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(GoogleLoginEvent());
                    },
                    child: const Text("Login with Google"),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: const InputDecoration(labelText: "Email"),
                    controller: TextEditingController(),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    controller: TextEditingController(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(EmailLoginEvent("test@example.com", "password"));
                    },
                    child: const Text("Login with Email"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
