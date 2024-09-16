// presentation/widgets/quiz_widgets.dart
import 'package:flutter/material.dart';
import '../../domain/entities/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/question_bloc/question_bloc.dart';

class QuizWidgets extends StatelessWidget {
  final List<Question> questions;

  const QuizWidgets({required this.questions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        return Column(
          children: [
            Text(question.question),
            ...question.options.map((option) => ListTile(
              title: Text(option),
              onTap: () {
                context.read<QuestionBloc>().add(SubmitAnswerEvent(index, option));
              },
            )),
          ],
        );
      },
    );
  }
}
