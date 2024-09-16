// domain/repositories/question_repository.dart
import '../entities/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestions();
}
