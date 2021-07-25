import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jaji_admin/constant/app_constant.dart';
import 'package:jaji_admin/models/quiz1/quiz_quiz1_model.dart';

///
///  create by tiennv on 2021/07/10
///
class QuizServices {
  /// thêm câu hỏi phần đọc hiểu tổng hợp
  void addDict(QuizModelQuiz1 quiz) async {
    //truy vấn
    final dictsRef = FirebaseFirestore.instance
        .collection(AppConfig.collection)
        .withConverter<QuizModelQuiz1>(
          fromFirestore: (snapshot, _) =>
              QuizModelQuiz1.fromJson(snapshot.data()!),
          toFirestore: (quiz, _) => quiz.toJson(),
        );

    await dictsRef.add(quiz);
  }
}
