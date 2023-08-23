import 'package:css/app/constants/my_logger.dart';
import 'package:css/app/models/card_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  late Worker? _selectedIndexEverWorker;

  final bannerIndex = 0.obs;
  final selectedIndex = 0.obs;
  final images = <CardModel>[
    CardModel(
      label: 'Library',
      image:
          'https://images.pexels.com/photos/6994992/pexels-photo-6994992.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    CardModel(
      label: 'Something',
      image:
          'https://images.pexels.com/photos/6994992/pexels-photo-6994992.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    CardModel(
      label: 'Something',
      image:
          'https://images.pexels.com/photos/6994992/pexels-photo-6994992.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    CardModel(
      label: 'Something',
      image:
          'https://images.pexels.com/photos/6994992/pexels-photo-6994992.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
  ].obs;

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

  void updateBannerIndex(int index) {
    bannerIndex.value = index;
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
