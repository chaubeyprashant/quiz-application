// data/models/question_model.dart
import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required String question,
    required List<String> options,
    required String correctAnswer,
  }) : super(question: question, options: options, correctAnswer: correctAnswer);

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correct_answer'],
    );
  }
}
