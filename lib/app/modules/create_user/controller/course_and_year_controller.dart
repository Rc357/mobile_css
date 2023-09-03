import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/enum/year_level_enum.dart';
import 'package:get/get.dart';

class CourseAndYearLevelController extends GetxController {
  static CourseAndYearLevelController get instance => Get.find();

  final selectedCourse = CourseEnum.unknown.obs;

  final courses = <CourseEnum>[].obs;
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

  void setCourseIfNotStudent(UserTypeEnum type) {
    if (type == UserTypeEnum.parents ||
        type == UserTypeEnum.alumni ||
        type == UserTypeEnum.guest) {
      courses.value = [];
    } else {
      courses.value = [
        CourseEnum.bsElementaryEducation,
        CourseEnum.bsEducationEnglishMath,
        CourseEnum.bsAutomotiveTechnology,
        CourseEnum.bsComputerEngineering,
        CourseEnum.bsElectricalTechnology,
        CourseEnum.bsElectronicsEngineering,
        CourseEnum.bsElectronicsTechnology,
        CourseEnum.bsEntrepreneurship,
        CourseEnum.bsFoodTechnology,
        CourseEnum.bsInformationSystem,
        CourseEnum.bsInformationTechnology,
        CourseEnum.bsInformationTechnologyAnimation,
        CourseEnum.bsMechanicalTechnology,
        CourseEnum.bsNursing,
        CourseEnum.bTechnologyLivelihoodEducation,
      ];
    }
  }

  void setYearLevelIfNotStudent(UserTypeEnum type) {
    if (type == UserTypeEnum.parents ||
        type == UserTypeEnum.alumni ||
        type == UserTypeEnum.guest) {
      yearLevel.value = [];
    }
  }
}
