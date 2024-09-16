// data/repositories/question_repository_impl.dart
import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../models/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  @override
  Future<List<Question>> getQuestions() async {
    // Simulate fetching from a network or database
    await Future.delayed(const Duration(seconds: 1));

    List<Map<String, dynamic>> jsonData = [
      {
        "question": "What is Flutter?",
        "options": ["SDK", "Framework", "Language", "Library"],
        "correct_answer": "SDK"
      },
      {
        "question": "Who developed Dart?",
        "options": ["Google", "Facebook", "Microsoft", "Apple"],
        "correct_answer": "Google"
      }
    ];

    return jsonData.map((json) => QuestionModel.fromJson(json)).toList();
  }
}
