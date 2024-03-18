import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/models/subjectmodel.dart';

class AnswerReport {
  final Map<int, int> selectedAnswer;
  final SubjectModel subjectModel;
  final int spentTime;

  int trueAnswerCount = 0;
  int falseAnswerCount = 0;
  double averageTimeForEach = 0;
  int totalTime = 0;
  double truePersonPage = 0.0;
  List wrongAnswer = [];

  AnswerReport({
    required this.selectedAnswer,
    required this.subjectModel,
    required this.spentTime,
  }){
    _chekAnswers();
  }

  _chekAnswers() {
    for(int i=0;i<subjectModel.questions.length; i++){
      QuizModel quiz = subjectModel.questions[i];
      int selection = selectedAnswer[i]!;
      switch(selection) {
        case 1:
          {
            if(quiz.trueAnswer == quiz.variant1) {
              trueAnswerCount++;
            }
          }
        case 2:
          {
            if(quiz.trueAnswer == quiz.variant2) {
              trueAnswerCount++;
            }
          }
        case 3:
          {
            if(quiz.trueAnswer == quiz.variant3) {
              trueAnswerCount++;
            }
          }
        case 4:
          {
            if(quiz.trueAnswer == quiz.variant4) {
              trueAnswerCount++;
            }
          }
          default:{}
      }
      falseAnswerCount = subjectModel.questions.length - trueAnswerCount;
      int onlySelectedAnswer = 0;

      for(int i=0; i<subjectModel.questions.length; i++) {
        if(selectedAnswer[i] != 0) {
          onlySelectedAnswer++;
        }
      }
      wrongAnswer.add(selectedAnswer[i]);
      averageTimeForEach = spentTime / onlySelectedAnswer;
    }


    totalTime = subjectModel.questions.length*10;
    truePersonPage = trueAnswerCount / subjectModel.questions.length;
  }
}



















