import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:quiz_application/presentation/bloc/question_bloc/question_bloc.dart';
import 'core/services/auth_service.dart';
import 'data/repositories/question_repository.dart';
import 'domain/repositories/question_repository.dart';
import 'domain/usecases/get_questions.dart';  // Import the new use case
import 'presentation/pages/dashboard_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/quiz_page.dart';
import 'presentation/pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Provide repository instances here
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(),
        ),
        RepositoryProvider<QuestionRepository>(
          create: (context) => QuestionRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Provide bloc instances here
          BlocProvider<AuthBloc>(
            create: (context) =>
            AuthBloc(context.read<AuthService>())..add(AuthInitialEvent()),
          ),
          BlocProvider<QuestionBloc>(
            create: (context) => QuestionBloc(
              GetQuestions(context.read<QuestionRepository>()),  // Inject the use case here
            )..add(LoadQuestionsEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'MCQ Quiz App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/dashboard': (context) => DashboardPage(),
            '/quiz': (context) => QuizPage(),
            '/result': (context) => ResultPage(score: 0), // Placeholder score
          },
        ),
      ),
    );
  }
}