// presentation/bloc/question_event.dart
part of 'question_bloc.dart';

abstract class QuestionEvent {}

class LoadQuestionsEvent extends QuestionEvent {}

class SubmitAnswerEvent extends QuestionEvent {
  final int index;
  final String answer;

  SubmitAnswerEvent(this.index, this.answer);
}
