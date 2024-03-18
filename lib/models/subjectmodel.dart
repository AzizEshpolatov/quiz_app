import 'package:quiz_app/models/levels.dart';
import 'package:quiz_app/models/quiz_model.dart';

import '../utils/utils_function.dart';

class SubjectModel {
  final String subjectName;
  final List<QuizModel> questions;
  final LevelModel levelModel;

  SubjectModel({
    required this.levelModel,
    required this.questions,
    required this.subjectName,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      questions: (json["question"] as List?)
              ?.map((e) => QuizModel.fromJson(e))
              .toList() ??
          [],
      subjectName: json["subject_name"] as String? ?? "",
      levelModel: getLevelFromString(
        json["levelModel"] as String? ?? "hard",
      ),
    );
  }
}
