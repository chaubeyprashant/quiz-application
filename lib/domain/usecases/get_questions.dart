
import '../entities/question.dart';
import '../repositories/question_repository.dart';

class GetQuestions {
  final QuestionRepository questionRepository;

  GetQuestions(this.questionRepository);

  Future<List<Question>> call() async {
    return await questionRepository.getQuestions();
  }
}