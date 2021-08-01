import 'package:get/get.dart';

class AddCtrl extends GetxController {
  ///Mã của form, mỗi mã tương ứng với 1 form
  RxString formCode = '1'.obs;

  /// cấp độ đã chọn
  RxString selectedLevel = 'N5'.obs;
  List<String> level = ['N5', 'N4', 'N3', 'N2', 'N1'];

  /// loại câu hỏi đã chọn
  RxString selectedType = 'Từ vựng'.obs;
  List<String> type = ['Từ vựng', 'Ngữ pháp', 'Đọc', 'Nghe'];

  /// thể loại con đã chọn
  RxString selectedSubType = 'Cách đọc kanji'.obs;
  List<String> subType = [
    'Cách đọc kanji',
    'Cách đọc hiragane',
    'Cấu tạo từ',
    'Từ đồng nghĩa',
    'Biểu hiện từ',
    'Cách dùng từ'
  ];

  /// thay đổi cấp độ
  void changeLevel(String newValue) {
    selectedLevel.update((val) {
      selectedLevel.value = newValue;
    });
    update();
  }

  /// thay đổi thể loại
  void changeType(String newValue) {
    selectedType.update((val) {
      selectedType.value = newValue;
    });

    /// Thiết định thể loại con theo thể loại
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
    switch (selectedSubType.value) {
      case 'Trả lời nhanh':
        formCode.update((val) {
          formCode.value = '2';
        });
        break;
      case 'Đọc hiểu tổng hợp':
        formCode.update((val) {
          formCode.value = '1';
        });
        break;
      default:
    }

    // if (selectedSubType.value == 'Trả lời nhanh') {
    //   formCode.update((val) {
    //     formCode.value = '2';
    //   });
    // } else {
    //   formCode.update((val) {
    //     formCode.value = '1';
    //   });
    // }
    update();
  }
}
