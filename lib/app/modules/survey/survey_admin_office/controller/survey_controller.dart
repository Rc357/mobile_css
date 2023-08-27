import 'package:css/app/models/survey_remarks.dart';
import 'package:css/app/repositories/questions_repository.dart';
import 'package:css/app/repositories/survey_remarks_repository.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:css/app/enum/survey_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/question_model.dart';
import 'package:css/app/models/user_model.dart';
import 'package:css/app/routes/app_pages.dart';

enum SurveyAdminOfficeStatus { initial, loading, submitted, error }

class SurveyAdminOfficeController extends GetxController {
  static SurveyAdminOfficeController get instance => Get.find();
  late Worker _statusEverWorker;
  final userId = ''.obs;

  final _status = SurveyAdminOfficeStatus.initial.obs;

  final expandableController = ExpandableController().obs;
  final userType = ''.obs;
  final question1 = FivePointsCaseEnum.unknown.obs;
  final question2 = FivePointsCaseEnum.unknown.obs;
  final optional = ''.obs;

  final isLibraryExpanded = false.obs;
  final userData = Get.arguments as UserModel;
  final adminsOfficeQuestions = <QuestionModel>[].obs;
  final adminsOfficeQuestionsAnswers = <QuestionModel>[].obs;

  bool get isLoading => _status.value == SurveyAdminOfficeStatus.loading;

  String currentState() =>
      'SurveyAdminOfficeController(Status: ${_status.value}, UserId: ${userId.value} Question1: ${question1.value}, Question2: ${question2.value}, Optional: ${optional.value} )';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorSurveyFormStatus();
    getQuestionsList();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorSurveyFormStatus() {
    _statusEverWorker = ever(
      _status,
      (value) async {
        switch (value) {
          case SurveyAdminOfficeStatus.error:
            MyLogger.printError(currentState());
            break;
          case SurveyAdminOfficeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case SurveyAdminOfficeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case SurveyAdminOfficeStatus.submitted:
            MyLogger.printInfo(currentState());
            Get.toNamed(AppPages.SURVEY_SUBMITTED);
            break;
        }
      },
    );
  }

  void getQuestionsList() async {
    final officeName = 'questions${userData.service.removeAllWhitespace}';
    MyLogger.printInfo("GET QUESTION OFFICE NAME: $officeName");
    adminsOfficeQuestions.value =
        await QuestionsRepository.getQuestions(officeName);
    adminsOfficeQuestionsAnswers.clear();
  }

  void updateSelectedUserType(String selectedType) {
    userType.value = selectedType;
    update();
  }

  void changeExpandableStatus() {
    expandableController.value.expanded = !expandableController.value.expanded;
    isLibraryExpanded.value = !isLibraryExpanded.value;
  }

  void addLibraryAnswerTwoCase(
      QuestionModel question, TwoPointsCaseEnum twoCase) {
    final userAnswer = Rxn<QuestionModel>();

    if (twoCase == TwoPointsCaseEnum.agree) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree + 1,
        disagree: question.disagree,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (twoCase == TwoPointsCaseEnum.disagree) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree + 1,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    }

    if (userAnswer.value != null) {
      if (adminsOfficeQuestionsAnswers.isNotEmpty) {
        var answerIndex = adminsOfficeQuestionsAnswers.indexWhere(
            (itemToCheck) => itemToCheck.id == userAnswer.value!.id);
        MyLogger.printInfo("answerIndex $answerIndex");
        if (answerIndex != -1) {
          MyLogger.printInfo("Replace Answer $answerIndex");
          adminsOfficeQuestionsAnswers[answerIndex] = userAnswer.value!;
        } else {
          adminsOfficeQuestionsAnswers.add(userAnswer.value!);
          MyLogger.printInfo("Add New Answer $answerIndex");
        }
      } else {
        adminsOfficeQuestionsAnswers.add(userAnswer.value!);
        MyLogger.printInfo("Add New Answer");
      }
    }
    MyLogger.printInfo(currentState());
  }

  void addLibraryAnswerFiveCase(
      QuestionModel question, FivePointsCaseEnum fiveCase) {
    final userAnswer = Rxn<QuestionModel>();

    if (fiveCase == FivePointsCaseEnum.excellent) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree,
        excellent: question.excellent + 1,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.verySatisfactory) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory + 1,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.satisfactory) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory + 1,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.fair) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair + 1,
        poor: question.poor,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.poor) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        agree: question.agree,
        disagree: question.disagree,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor + 1,
        type: question.type,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    }
    if (userAnswer.value != null) {
      if (adminsOfficeQuestionsAnswers.isNotEmpty) {
        var answerIndex = adminsOfficeQuestionsAnswers.indexWhere(
            (itemToCheck) => itemToCheck.id == userAnswer.value!.id);
        MyLogger.printInfo("answerIndex $answerIndex");
        if (answerIndex != -1) {
          MyLogger.printInfo("Replace Answer $answerIndex");
          adminsOfficeQuestionsAnswers[answerIndex] = userAnswer.value!;
        } else {
          adminsOfficeQuestionsAnswers.add(userAnswer.value!);
          MyLogger.printInfo("Add New Answer $answerIndex");
        }
      } else {
        adminsOfficeQuestionsAnswers.add(userAnswer.value!);
        MyLogger.printInfo("Add New Answer");
      }
    }
    MyLogger.printInfo(currentState());
  }

  void setOptionalValue(String text) {
    optional.value = text;
    MyLogger.printInfo(currentState());
  }

  Future<void> submitData() async {
    _status.value = SurveyAdminOfficeStatus.loading;
    if (adminsOfficeQuestionsAnswers.length != adminsOfficeQuestions.length) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = SurveyAdminOfficeStatus.error;
    } else {
      final officeName = 'questions${userData.service.removeAllWhitespace}';
      for (var answer in adminsOfficeQuestionsAnswers) {
        final answerToQuestion = QuestionModel(
          id: answer.id,
          questionNumber: answer.questionNumber,
          question: answer.question,
          agree: answer.agree,
          disagree: answer.disagree,
          excellent: answer.excellent,
          verySatisfactory: answer.verySatisfactory,
          satisfactory: answer.satisfactory,
          fair: answer.fair,
          poor: answer.poor,
          type: answer.type,
          updatedAt: DateTime.now(),
          createdAt: answer.createdAt,
        );
        await QuestionsRepository.updateQuestionViaId(
            answerToQuestion, officeName);
      }

      if (optional.isNotEmpty) {
        final remark = SurveyRemarksModel(
          id: '',
          remarks: optional.value,
          referenceUser: userData.reference,
          officeName: userData.service,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await SurveyRemarksRepository.createSurveyRemarks(remark);
      }

      final updatedUser = UserModel(
          answered: true,
          contact: userData.contact,
          createdAt: userData.createdAt,
          name: userData.name,
          reference: userData.reference,
          service: userData.service,
          uid: userData.uid,
          updatedAt: DateTime.now(),
          userType: userData.userType);
      UserRepository.updateUserAlreadyAnswer(updatedUser);
      _status.value = SurveyAdminOfficeStatus.submitted;
    }
  }
}
