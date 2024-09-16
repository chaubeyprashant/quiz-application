import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_questions.dart';
import '../../../domain/entities/question.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestions getQuestions;

  QuestionBloc(this.getQuestions) : super(QuestionInitial()) {
    // Handle the LoadQuestionsEvent to fetch questions
    on<LoadQuestionsEvent>((event, emit) async {
      emit(QuestionsLoading());
      try {
        final questions = await getQuestions();
        emit(QuestionsLoaded(questions));
      } catch (e) {
        emit(QuestionsError('Failed to load questions'));
      }
    });

    // Handle the SubmitAnswerEvent to check if the answer is correct
    on<SubmitAnswerEvent>((event, emit) {
      if (state is QuestionsLoaded) {
        final currentState = state as QuestionsLoaded;
        final question = currentState.questions[event.index];
        final isCorrect = question.correctAnswer == event.answer;
        emit(AnswerResult(isCorrect));
      }
    });
  }
}