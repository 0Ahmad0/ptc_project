class UserLanguage{
  String? lanName;
  int? level;
  UserLanguage({this.lanName,this.level});
}
class UserSkils{
  String? skilName;
  int? level;
  UserSkils({this.skilName,this.level});
}
class UserCourses{
  String? courseName;
  DateTime? courseDate;
  String? courseDescription;
  int? level;
  String? courseCertificate;
  String? certificate;
  String? certificateType;
  String? certificateSide;

  UserCourses(
      {this.courseName,
      this.courseDate,
      this.courseDescription,
      this.level,
      this.courseCertificate,
      this.certificate,
      this.certificateType,
      this.certificateSide});
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
temp@gmail.com   123456
 */
