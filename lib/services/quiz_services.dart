import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jaji_admin/constant/config.dart';
import 'package:jaji_admin/models/quiz1/qs_read1_model.dart';
import 'package:jaji_admin/models/quiz1/quiz_quiz1_model.dart';

///
///  create by tiennv on 2021/07/10
///
class QuizServices {
  /// thêm câu hỏi phần đọc hiểu tổng hợp
  void addDict(QuizModelQuiz1 quiz) async {
    QsRead1Model qsMutation = QsRead1Model();
    qsMutation = mutationFunctions(quiz);
    //qsMutation.qsFurigana1 = quiz.questionFurigana![0];

    //truy vấn
    final dictsRef = FirebaseFirestore.instance
        .collection(AppConfig.collection)
        .withConverter<QsRead1Model>(
          fromFirestore: (snapshot, _) =>
              QsRead1Model.fromJson(snapshot.data()!),
          toFirestore: (quizMu, _) => quizMu.toJson(),
        );
    // print(qsMutation.toJson());
    await dictsRef.add(qsMutation);

    // FirebaseFirestore.instance
    //     .collection(AppConfig.collection)
    //     .doc('id')
    //     .set(quiz.toJson())
    //     .then((value) => null);
  }

  /// chuyển về dạng không có mảng lồng nhau
  QsRead1Model mutationFunctions(QuizModelQuiz1 quiz) {
    QsRead1Model qsMutation = QsRead1Model();
    qsMutation.questionNormal = quiz.questionNormal;
    if (quiz.questionFurigana!.length - 1 >= 0 &&
        quiz.questionFurigana![0] != null) {
      qsMutation.qsFurigana1 = quiz.questionFurigana![0];
    }
    if (quiz.questionFurigana!.length - 1 >= 1 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana2 = quiz.questionFurigana![1];
    }
    if (quiz.questionFurigana!.length - 1 >= 2 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana3 = quiz.questionFurigana![2];
    }
    if (quiz.questionFurigana!.length - 1 >= 3 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana4 = quiz.questionFurigana![3];
    }
    if (quiz.questionFurigana!.length - 1 >= 4 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana5 = quiz.questionFurigana![4];
    }
    if (quiz.questionFurigana!.length - 1 >= 5 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana6 = quiz.questionFurigana![5];
    }
    if (quiz.questionFurigana!.length - 1 >= 6 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana7 = quiz.questionFurigana![6];
    }
    if (quiz.questionFurigana!.length - 1 >= 7 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana8 = quiz.questionFurigana![7];
    }
    if (quiz.questionFurigana!.length - 1 >= 8 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana9 = quiz.questionFurigana![8];
    }
    if (quiz.questionFurigana!.length - 1 >= 9 &&
        quiz.questionFurigana != null) {
      qsMutation.qsFurigana10 = quiz.questionFurigana![9];
    }
    if (quiz.questionFurigana!.length - 1 >= 10 &&
        quiz.questionFurigana![10] != null) {
      qsMutation.qsFurigana11 = quiz.questionFurigana![10];
    }
    if (quiz.questionFurigana!.length - 1 >= 11 &&
        quiz.questionFurigana![11] != null) {
      qsMutation.qsFurigana12 = quiz.questionFurigana![11];
    }
    if (quiz.questionFurigana!.length - 1 >= 12 &&
        quiz.questionFurigana![12] != null) {
      qsMutation.qsFurigana13 = quiz.questionFurigana![12];
    }
    if (quiz.questionFurigana!.length - 1 >= 13 &&
        quiz.questionFurigana![13] != null) {
      qsMutation.qsFurigana14 = quiz.questionFurigana![13];
    }
    if (quiz.questionFurigana!.length - 1 >= 14 &&
        quiz.questionFurigana![14] != null) {
      qsMutation.qsFurigana15 = quiz.questionFurigana![14];
    }
    if (quiz.questionTranslate!.length != 0) {
      qsMutation.qsTranslate = quiz.questionTranslate;
    }

// câu hỏi 1
    if (quiz.listSubQuestion![0].subQuestionNormal != null) {
      qsMutation.subQsNormal1 = quiz.listSubQuestion![0].subQuestionNormal;
    }
    if (quiz.listSubQuestion![0].subQuestionFurigana != null) {
      qsMutation.subQsFurigana1 =
          quiz.listSubQuestion![0].subQuestionFurigana![0];
    }
    if (quiz.listSubQuestion![0].listSubQuestion![0].isTrue != null) {
      qsMutation.isTrue1 = quiz.listSubQuestion![0].listSubQuestion![0].isTrue;
    }
    if (quiz.listSubQuestion![0].explain != null) {
      qsMutation.explain1 = quiz.listSubQuestion![0].explain;
    }
    if (quiz.listSubQuestion![0].listSubQuestion![0].answerNormal != null) {
      qsMutation.asNormal11 =
          quiz.listSubQuestion![0].listSubQuestion![0].answerNormal;
    }
    if (quiz.listSubQuestion![0].listSubQuestion![1].answerNormal != null) {
      qsMutation.asNormal12 =
          quiz.listSubQuestion![0].listSubQuestion![1].answerNormal;
    }
    if (quiz.listSubQuestion![0].listSubQuestion![2].answerNormal != null) {
      qsMutation.asNormal13 =
          quiz.listSubQuestion![0].listSubQuestion![2].answerNormal;
    }
    if (quiz.listSubQuestion![0].listSubQuestion![3].answerNormal != null) {
      qsMutation.asNormal14 =
          quiz.listSubQuestion![0].listSubQuestion![3].answerNormal;
    }
    if (quiz.listSubQuestion![0].listSubQuestion![0].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana11 =
          quiz.listSubQuestion![0].listSubQuestion![0].answerFurigana![0];
    }
    if (quiz.listSubQuestion![0].listSubQuestion![1].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana12 =
          quiz.listSubQuestion![0].listSubQuestion![1].answerFurigana![0];
    }
    if (quiz.listSubQuestion![0].listSubQuestion![2].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana13 =
          quiz.listSubQuestion![0].listSubQuestion![2].answerFurigana![0];
    }
    if (quiz.listSubQuestion![0].listSubQuestion![3].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana14 =
          quiz.listSubQuestion![0].listSubQuestion![3].answerFurigana![0];
    }

// câu hỏi 2
    if (quiz.listSubQuestion![1].subQuestionNormal != null) {
      qsMutation.subQsNormal2 = quiz.listSubQuestion![1].subQuestionNormal;
    }
    if (quiz.listSubQuestion![1].subQuestionFurigana != null) {
      qsMutation.subQsFurigana2 =
          quiz.listSubQuestion![1].subQuestionFurigana![0];
    }
    if (quiz.listSubQuestion![1].listSubQuestion![0].isTrue != null) {
      qsMutation.isTrue2 = quiz.listSubQuestion![1].listSubQuestion![0].isTrue;
    }
    if (quiz.listSubQuestion![1].explain != null) {
      qsMutation.explain2 = quiz.listSubQuestion![1].explain;
    }
    if (quiz.listSubQuestion![1].listSubQuestion![0].answerNormal != null) {
      qsMutation.asNormal21 =
          quiz.listSubQuestion![1].listSubQuestion![0].answerNormal;
    }
    if (quiz.listSubQuestion![1].listSubQuestion![1].answerNormal != null) {
      qsMutation.asNormal22 =
          quiz.listSubQuestion![1].listSubQuestion![1].answerNormal;
    }
    if (quiz.listSubQuestion![1].listSubQuestion![2].answerNormal != null) {
      qsMutation.asNormal23 =
          quiz.listSubQuestion![1].listSubQuestion![2].answerNormal;
    }
    if (quiz.listSubQuestion![1].listSubQuestion![3].answerNormal != null) {
      qsMutation.asNormal24 =
          quiz.listSubQuestion![1].listSubQuestion![3].answerNormal;
    }
    if (quiz.listSubQuestion![1].listSubQuestion![0].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana21 =
          quiz.listSubQuestion![1].listSubQuestion![0].answerFurigana![0];
    }
    if (quiz.listSubQuestion![1].listSubQuestion![1].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana22 =
          quiz.listSubQuestion![1].listSubQuestion![1].answerFurigana![0];
    }
    if (quiz.listSubQuestion![1].listSubQuestion![2].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana23 =
          quiz.listSubQuestion![1].listSubQuestion![2].answerFurigana![0];
    }
    if (quiz.listSubQuestion![1].listSubQuestion![3].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana24 =
          quiz.listSubQuestion![1].listSubQuestion![3].answerFurigana![0];
    }

// câu hỏi 3
    if (quiz.listSubQuestion![2].subQuestionNormal != null) {
      qsMutation.subQsNormal3 = quiz.listSubQuestion![2].subQuestionNormal;
    }
    if (quiz.listSubQuestion![2].subQuestionFurigana != null) {
      qsMutation.subQsFurigana3 =
          quiz.listSubQuestion![2].subQuestionFurigana![0];
    }
    if (quiz.listSubQuestion![2].listSubQuestion![0].isTrue != null) {
      qsMutation.isTrue3 = quiz.listSubQuestion![2].listSubQuestion![0].isTrue;
    }
    if (quiz.listSubQuestion![2].explain != null) {
      qsMutation.explain3 = quiz.listSubQuestion![2].explain;
    }
    if (quiz.listSubQuestion![2].listSubQuestion![0].answerNormal != null) {
      qsMutation.asNormal31 =
          quiz.listSubQuestion![2].listSubQuestion![0].answerNormal;
    }
    if (quiz.listSubQuestion![2].listSubQuestion![1].answerNormal != null) {
      qsMutation.asNormal32 =
          quiz.listSubQuestion![2].listSubQuestion![1].answerNormal;
    }
    if (quiz.listSubQuestion![2].listSubQuestion![2].answerNormal != null) {
      qsMutation.asNormal33 =
          quiz.listSubQuestion![2].listSubQuestion![2].answerNormal;
    }
    if (quiz.listSubQuestion![2].listSubQuestion![3].answerNormal != null) {
      qsMutation.asNormal34 =
          quiz.listSubQuestion![2].listSubQuestion![3].answerNormal;
    }
    if (quiz.listSubQuestion![2].listSubQuestion![0].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana31 =
          quiz.listSubQuestion![2].listSubQuestion![0].answerFurigana![0];
    }
    if (quiz.listSubQuestion![2].listSubQuestion![1].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana32 =
          quiz.listSubQuestion![2].listSubQuestion![1].answerFurigana![0];
    }
    if (quiz.listSubQuestion![2].listSubQuestion![2].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana33 =
          quiz.listSubQuestion![2].listSubQuestion![2].answerFurigana![0];
    }
    if (quiz.listSubQuestion![2].listSubQuestion![3].answerFurigana!.length !=
        0) {
      qsMutation.asFurigana34 =
          quiz.listSubQuestion![2].listSubQuestion![3].answerFurigana![0];
    }

    return qsMutation;
  }
}
