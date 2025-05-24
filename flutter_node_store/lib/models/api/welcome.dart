import 'package:json_annotation/json_annotation.dart';

part 'welcome.g.dart';

@JsonSerializable(explicitToJson: true)
class Welcome {
  String name;
  String description;
  List<String> tag;
  Permission permission;

  Welcome({
    required this.name,
    required this.description,
    required this.tag,
    required this.permission,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) =>
      _$WelcomeFromJson(json);

  Map<String, dynamic> toJson() => _$WelcomeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Permission {
  Dashboard dashboard;
  Dashboard plan;
  ExerciseManagements exerciseManagements;
  Dashboard reports;
  UserManagements userManagements;

  Permission({
    required this.dashboard,
    required this.plan,
    required this.exerciseManagements,
    required this.reports,
    required this.userManagements,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Dashboard {
  bool view;
  bool create;
  bool edit;
  bool delete;
  String scope;

  Dashboard({
    required this.view,
    required this.create,
    required this.edit,
    required this.delete,
    required this.scope,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExerciseManagements {
  bool view;
  bool create;
  bool edit;
  bool delete;
  String scope;
  Dashboard exercise;
  Dashboard generalInfo;
  Dashboard about;
  Dashboard task;
  Dashboard attachedFile;
  Dashboard organization;
  Dashboard participant;
  Dashboard activity;

  ExerciseManagements({
    required this.view,
    required this.create,
    required this.edit,
    required this.delete,
    required this.scope,
    required this.exercise,
    required this.generalInfo,
    required this.about,
    required this.task,
    required this.attachedFile,
    required this.organization,
    required this.participant,
    required this.activity,
  });

  factory ExerciseManagements.fromJson(
    Map<String, dynamic> json,
  ) => _$ExerciseManagementsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExerciseManagementsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserManagements {
  bool view;
  bool create;
  bool edit;
  bool delete;
  String scope;
  Dashboard users;
  Dashboard rolesAndPermission;

  UserManagements({
    required this.view,
    required this.create,
    required this.edit,
    required this.delete,
    required this.scope,
    required this.users,
    required this.rolesAndPermission,
  });

  factory UserManagements.fromJson(
    Map<String, dynamic> json,
  ) => _$UserManagementsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserManagementsToJson(this);
}
