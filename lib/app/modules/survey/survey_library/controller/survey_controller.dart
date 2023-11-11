import 'package:css/app/enum/offices_key_enum.dart';
import 'package:css/app/enum/survey_enum.dart';
import 'package:css/app/helpers/my_logger_helper.dart';
import 'package:css/app/models/question_model.dart';
import 'package:css/app/models/submitted_model.dart';
import 'package:css/app/models/survey_remarks.dart';
import 'package:css/app/models/user_library_model.dart';
import 'package:css/app/repositories/questions_repository.dart';
import 'package:css/app/repositories/survey_remarks_repository.dart';
import 'package:css/app/repositories/user_repository.dart';
import 'package:css/app/routes/app_pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SurveyLibraryStatus { initial, loading, loaded, submitted, error }

class SurveyLibraryController extends GetxController {
  static SurveyLibraryController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = SurveyLibraryStatus.initial.obs;

  final expandableController = ExpandableController().obs;
  final userType = ''.obs;

  final optional = ''.obs;
  final officeName = 'questionsLibrary';

  final isLibraryExpanded = false.obs;

  final userData = Get.arguments as UserLibraryModel;
  final libraryQuestions = <QuestionModel>[].obs;
  final libraryQuestionsAnswers = <QuestionModel>[].obs;
  final questionLatestVersion = Rxn<QuestionModel>();
  final questionVersion = 0.obs;

  bool get isLoading => _status.value == SurveyLibraryStatus.loading;

  String currentState() =>
      'SurveyLibraryController(Status: ${_status.value}, libraryQuestions length: ${libraryQuestions.length} , libraryQuestionsAnswers : ${libraryQuestionsAnswers.length})';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorSurveyFormStatus();
    getLatestVersion();
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
          case SurveyLibraryStatus.error:
            MyLogger.printError(currentState());
            break;
          case SurveyLibraryStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case SurveyLibraryStatus.loaded:
            MyLogger.printInfo(currentState());
            break;
          case SurveyLibraryStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case SurveyLibraryStatus.submitted:
            MyLogger.printInfo(currentState());

            final dataPass = SubmittedArgs(
                version: questionVersion.value,
                officeQRData: OfficeQRData.library);
            Get.offAndToNamed(AppPages.SURVEY_SUBMITTED, arguments: dataPass);
            break;
        }
      },
    );
  }

  void getLatestVersion() async {
    _status.value = SurveyLibraryStatus.loading;
    MyLogger.printInfo("GET QUESTION VERSION: $officeName");
    questionLatestVersion.value =
        await QuestionsRepository.findLatestVersion(officeName);

    getQuestionsList();
  }

  void getQuestionsList() async {
    MyLogger.printInfo("GET QUESTION OFFICE NAME: $officeName");
    libraryQuestions.value = await QuestionsRepository.getQuestions(
        officeName, questionLatestVersion.value!.version);
    libraryQuestionsAnswers.clear();

    _status.value = SurveyLibraryStatus.loaded;
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
    questionVersion.value = question.version;
    final userAnswer = Rxn<QuestionModel>();

    if (twoCase == TwoPointsCaseEnum.yes) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes + 1,
        no: question.no,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (twoCase == TwoPointsCaseEnum.no) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no + 1,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    }

    if (userAnswer.value != null) {
      if (libraryQuestionsAnswers.isNotEmpty) {
        var answerIndex = libraryQuestionsAnswers.indexWhere(
            (itemToCheck) => itemToCheck.id == userAnswer.value!.id);
        MyLogger.printInfo("answerIndex $answerIndex");
        if (answerIndex != -1) {
          MyLogger.printInfo("Replace Answer $answerIndex");
          libraryQuestionsAnswers[answerIndex] = userAnswer.value!;
        } else {
          libraryQuestionsAnswers.add(userAnswer.value!);
          MyLogger.printInfo("Add New Answer $answerIndex");
        }
      } else {
        libraryQuestionsAnswers.add(userAnswer.value!);
        MyLogger.printInfo("Add New Answer");
      }
    }
    MyLogger.printInfo(currentState());
  }

  void addLibraryAnswerFiveCase(
      QuestionModel question, FivePointsCaseEnum fiveCase) {
    questionVersion.value = question.version;
    final userAnswer = Rxn<QuestionModel>();

    if (fiveCase == FivePointsCaseEnum.excellent) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no,
        excellent: question.excellent + 1,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.verySatisfactory) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory + 1,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.satisfactory) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory + 1,
        fair: question.fair,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.fair) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair + 1,
        poor: question.poor,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    } else if (fiveCase == FivePointsCaseEnum.poor) {
      userAnswer.value = QuestionModel(
        id: question.id,
        question: question.question,
        questionNumber: question.questionNumber,
        yes: question.yes,
        no: question.no,
        excellent: question.excellent,
        verySatisfactory: question.verySatisfactory,
        satisfactory: question.satisfactory,
        fair: question.fair,
        poor: question.poor + 1,
        type: question.type,
        version: question.version,
        updatedAt: DateTime.now(),
        createdAt: question.createdAt,
      );
    }
    if (userAnswer.value != null) {
      if (libraryQuestionsAnswers.isNotEmpty) {
        var answerIndex = libraryQuestionsAnswers.indexWhere(
            (itemToCheck) => itemToCheck.id == userAnswer.value!.id);
        MyLogger.printInfo("answerIndex $answerIndex");
        if (answerIndex != -1) {
          MyLogger.printInfo("Replace Answer $answerIndex");
          libraryQuestionsAnswers[answerIndex] = userAnswer.value!;
        } else {
          libraryQuestionsAnswers.add(userAnswer.value!);
          MyLogger.printInfo("Add New Answer $answerIndex");
        }
      } else {
        libraryQuestionsAnswers.add(userAnswer.value!);
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
    _status.value = SurveyLibraryStatus.loading;
    if (libraryQuestionsAnswers.length != libraryQuestions.length) {
      Get.snackbar(
        'Warning!',
        "Please make sure all data is valid.",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.add_alert),
      );

      _status.value = SurveyLibraryStatus.error;
    } else {
      for (var answer in libraryQuestionsAnswers) {
        final answerToQuestion = QuestionModel(
          id: answer.id,
          questionNumber: answer.questionNumber,
          question: answer.question,
          yes: answer.yes,
          no: answer.no,
          excellent: answer.excellent,
          verySatisfactory: answer.verySatisfactory,
          satisfactory: answer.satisfactory,
          fair: answer.fair,
          poor: answer.poor,
          type: answer.type,
          version: answer.version,
          updatedAt: DateTime.now(),
          createdAt: answer.createdAt,
        );
        await QuestionsRepository.updateQuestionViaId(
            answerToQuestion, officeName);
      }

      await QuestionsRepository.createNotificationData(
        questionnaireVersion: 'questionnaireVersionLibrary',
        version: libraryQuestionsAnswers[0].version,
        userId: userData.uid,
        officeName: 'library',
      );

      if (optional.isNotEmpty) {
        final remark = SurveyRemarksModel(
          id: '',
          remarks: optional.value,
          referenceUser: userData.uid,
          officeName: OfficeQRData.library.name,
          version: questionVersion.value,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await SurveyRemarksRepository.createSurveyRemarks(remark);
      }

      final updatedUser = UserLibraryModel(
        uid: userData.uid,
        name: userData.name,
        contact: userData.contact,
        course: userData.course,
        gender: userData.gender,
        userType: userData.userType,
        studentId: userData.studentId,
        answered: true,
        version: questionVersion.value,
        createdAt: userData.createdAt,
        updatedAt: DateTime.now(),
      );
      await UserRepository.updateUserLibraryAlreadyAnswer(updatedUser);

      _status.value = SurveyLibraryStatus.submitted;
    }
  }
}
