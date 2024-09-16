// presentation/bloc/question_state.dart
part of 'question_bloc.dart';

abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionsLoading extends QuestionState {}

class QuestionsLoaded extends QuestionState {
  final List<Question> questions;

  QuestionsLoaded(this.questions);
}

class QuestionsError extends QuestionState {
  final String message;

  QuestionsError(this.message);
}

class AnswerResult extends QuestionState {
  final bool isCorrect;

  AnswerResult(this.isCorrect);
}
