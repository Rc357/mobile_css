import 'package:css/constants/my_logger.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  late Worker? _selectedIndexEverWorker;

  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _monitorSelectedIndex();
  }

  @override
  void onClose() {
    _selectedIndexEverWorker?.dispose();
    super.onClose();
  }

  void _monitorSelectedIndex() {
    _selectedIndexEverWorker = ever(
      selectedIndex,
      (int value) {
        if (value == 0) {
          myLogger.i(currentState);
        }
        if (value == 1) {
          myLogger.i(currentState);
        }
      },
    );
  }

  void updateSelectedIndex(int index) {
    if (index == 2) {
      // Get.toNamed(AppPages.CREATE_ITEM);
    } else {
      selectedIndex.value = index;
    }
  }

  String currentState() => 'HomeController(status: ${selectedIndex.value})';
}
