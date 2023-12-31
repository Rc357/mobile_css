import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:css/app/enum/course_enum.dart';
import 'package:css/app/enum/type_user_enum.dart';
import 'package:css/app/enum/year_level_enum.dart';

class UserAdminOfficeModel {
  static const UID = 'uid';
  static const NAME = 'name';
  static const COURSE = 'course';
  static const YEAR_LEVEL = 'yearLevel';
  static const USER_TYPE = 'userType';
  static const STUDENT_ID = 'studentId';
  static const ANSWERED = 'answered';
  static const VERSION = 'version';
  static const CREATED_AT = 'created_at';
  static const UPDATED_AT = 'updated_at';

  final String uid;
  final String name;
  final CourseEnum course;
  final YearLevelEnum yearLevel;
  final UserTypeEnum userType;
  final String studentId;
  final bool answered;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserAdminOfficeModel({
    required this.uid,
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.userType,
    required this.studentId,
    required this.answered,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UID: uid,
      NAME: name,
      COURSE: course.name,
      YEAR_LEVEL: yearLevel.name,
      USER_TYPE: userType.name,
      STUDENT_ID: studentId,
      ANSWERED: answered,
      VERSION: version,
      CREATED_AT: FieldValue.serverTimestamp(),
      UPDATED_AT: FieldValue.serverTimestamp(),
    };
  }

  factory UserAdminOfficeModel.fromMap(Map<String, dynamic> map) {
    return UserAdminOfficeModel(
      uid: map[UID] as String,
      name: map[NAME] as String,
      course: CourseEnum.values.byName(map[COURSE] as String),
      yearLevel: YearLevelEnum.values.byName(map[YEAR_LEVEL] as String),
      userType: UserTypeEnum.values.byName(map[USER_TYPE] as String),
      studentId: map[STUDENT_ID] as String,
      answered: map[ANSWERED] as bool,
      version: map[VERSION] as int,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }

  factory UserAdminOfficeModel.fromDocument(DocumentSnapshot documentSnapshot) {
    final map = documentSnapshot.data() as Map<String, dynamic>;
    return UserAdminOfficeModel(
      uid: map[UID] as String,
      name: map[NAME] as String,
      course: map[COURSE] as CourseEnum,
      yearLevel: map[YEAR_LEVEL] as YearLevelEnum,
      userType: map[USER_TYPE] as UserTypeEnum,
      studentId: map[STUDENT_ID] as String,
      answered: map[ANSWERED] as bool,
      version: map[VERSION] as int,
      createdAt: (map[CREATED_AT] as Timestamp).toDate(),
      updatedAt: (map[UPDATED_AT] as Timestamp).toDate(),
    );
  }
}
