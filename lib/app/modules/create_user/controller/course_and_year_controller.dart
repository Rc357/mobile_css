import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/year_level_enum.dart';
import 'package:get/get.dart';

class CourseAndYearLevelController extends GetxController {
  static CourseAndYearLevelController get instance => Get.find();

  final selectedCourse = CourseEnum.unknown.obs;

  final yearLevel = <YearLevelEnum>[].obs;

  void setSelectedCourse(CourseEnum course) {
    if (course == CourseEnum.bsComputerEngineering) {
      yearLevel.value = [
        YearLevelEnum.firstYear,
        YearLevelEnum.secondYear,
        YearLevelEnum.thirdYear,
        YearLevelEnum.fourthYear,
        YearLevelEnum.fifthYear,
      ];
    } else {
      yearLevel.value = [
        YearLevelEnum.firstYear,
        YearLevelEnum.secondYear,
        YearLevelEnum.thirdYear,
        YearLevelEnum.fourthYear,
      ];
    }
  }
}
