import 'package:get/get.dart';
import 'package:jaji_admin/models/quiz_model.dart';

class AddCtrl extends GetxController {
  //Mã của form thêm câu hỏi
  RxString formCode = '1'.obs;
  // Chọn level
  RxString selectedLevel = 'N5'.obs;
  List<String> level = ['N5', 'N4', 'N3', 'N2', 'N1'];
//Chọn thể loại câu hỏi
  RxString selectedType = 'Từ vựng'.obs;
  List<String> type = ['Từ vựng', 'Ngữ pháp', 'Đọc', 'Nghe'];
  //Chọn sub type
  RxString selectedSubType = 'Cách đọc kanji'.obs;
  Rx<QuizModel> quizModel = QuizModel().obs;
  List<String> subType = [
    'Cách đọc kanji',
    'Cách đọc hiragane',
    'Cấu tạo từ',
    'Từ đồng nghĩa',
    'Biểu hiện từ',
    'Cách dùng từ'
  ];
  String content = ''; // câu hỏi
  String answerContent1 = '';
  String answerContent2 = '';
  String answerContent3 = '';
  String answerContent4 = '';
  List<String> underline = [];
  var answer;
  String explain = ''; // giải thích
  var count = 0.obs;
  void increment() {
    count++;
    print(count);
    // update();
  }

// thay đổi cấp độ
  void changeLevel(String newValue) {
    selectedLevel.update((val) {
      selectedLevel.value = newValue;
    });
    update();
  }

// thay đổi thể loại
  void changeType(String newValue) {
    selectedType.update((val) {
      selectedType.value = newValue;
    });

    // Thiết định thể loại con theo thể loại
    switch (selectedType.value) {
      case 'Từ vựng':
        subType = [
          'Cách đọc kanji',
          'Cách đọc hiragane',
          'Cấu tạo từ',
          'Từ đồng nghĩa',
          'Biểu hiện từ',
          'Cách dùng từ'
        ];
        selectedSubType.value = 'Cách đọc kanji';
        break;
      case 'Ngữ pháp':
        subType = [
          'Dạng ngữ pháp',
          'Ngữ pháp theo đoạn văn',
          'Thành lập câu',
        ];
        selectedSubType.value = 'Dạng ngữ pháp';
        break;
      case 'Đọc':
        subType = [
          'Đoạn văn ngắn',
          'Đoạn văn trung bình',
          'Đọc hiểu tổng hợp',
          'Đọc hiểu chủ đề',
          'Tìm kiếm thôn tin',
        ];
        selectedSubType.value = 'Đoạn văn ngắn';
        break;
      case 'Nghe':
        subType = [
          'Nghe hiểu chủ đề',
          'Nghe hiểu điểm chính',
          'Nghe hiểu khái quát',
          'Trả lời nhanh',
        ];
        selectedSubType.value = 'Nghe hiểu chủ đề';
        break;
      default:
    }
    update();
  }

  // thay đổi thể loại con
  void changeSubType(String newValue) {
    selectedSubType.update((val) {
      selectedSubType.value = newValue;
    });

    if (selectedSubType == 'Trả lời nhanh') {
      formCode.update((val) {
        formCode.value = '2';
      });
    } else {
      formCode.update((val) {
        formCode.value = '1';
      });
    }
    update();
  }

  void addUnderline(String value) {
    underline.add(value);
  }

  // Lưu câu hỏi
  void save() {
    print(content);
  }
}
