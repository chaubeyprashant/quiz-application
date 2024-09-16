// presentation/pages/quiz_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/question_bloc/question_bloc.dart';
import '../widgets/quiz_widgets.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is QuestionsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuestionsLoaded) {
            return QuizWidgets(questions: state.questions);
          }
          return Container();
        },
      ),
    );
  }
}