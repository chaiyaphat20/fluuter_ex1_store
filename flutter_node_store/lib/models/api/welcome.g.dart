// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Welcome _$WelcomeFromJson(Map<String, dynamic> json) => Welcome(
  name: json['name'] as String,
  description: json['description'] as String,
  tag: (json['tag'] as List<dynamic>).map((e) => e as String).toList(),
  permission: Permission.fromJson(json['permission'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WelcomeToJson(Welcome instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'tag': instance.tag,
  'permission': instance.permission.toJson(),
};

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  dashboard: Dashboard.fromJson(json['dashboard'] as Map<String, dynamic>),
  plan: Dashboard.fromJson(json['plan'] as Map<String, dynamic>),
  exerciseManagements: ExerciseManagements.fromJson(
    json['exerciseManagements'] as Map<String, dynamic>,
  ),
  reports: Dashboard.fromJson(json['reports'] as Map<String, dynamic>),
  userManagements: UserManagements.fromJson(
    json['userManagements'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'dashboard': instance.dashboard.toJson(),
      'plan': instance.plan.toJson(),
      'exerciseManagements': instance.exerciseManagements.toJson(),
      'reports': instance.reports.toJson(),
      'userManagements': instance.userManagements.toJson(),
    };

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
  view: json['view'] as bool,
  create: json['create'] as bool,
  edit: json['edit'] as bool,
  delete: json['delete'] as bool,
  scope: json['scope'] as String,
);

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
  'view': instance.view,
  'create': instance.create,
  'edit': instance.edit,
  'delete': instance.delete,
  'scope': instance.scope,
};

ExerciseManagements _$ExerciseManagementsFromJson(
  Map<String, dynamic> json,
) => ExerciseManagements(
  view: json['view'] as bool,
  create: json['create'] as bool,
  edit: json['edit'] as bool,
  delete: json['delete'] as bool,
  scope: json['scope'] as String,
  exercise: Dashboard.fromJson(json['exercise'] as Map<String, dynamic>),
  generalInfo: Dashboard.fromJson(json['generalInfo'] as Map<String, dynamic>),
  about: Dashboard.fromJson(json['about'] as Map<String, dynamic>),
  task: Dashboard.fromJson(json['task'] as Map<String, dynamic>),
  attachedFile: Dashboard.fromJson(
    json['attachedFile'] as Map<String, dynamic>,
  ),
  organization: Dashboard.fromJson(
    json['organization'] as Map<String, dynamic>,
  ),
  participant: Dashboard.fromJson(json['participant'] as Map<String, dynamic>),
  activity: Dashboard.fromJson(json['activity'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ExerciseManagementsToJson(
  ExerciseManagements instance,
) => <String, dynamic>{
  'view': instance.view,
  'create': instance.create,
  'edit': instance.edit,
  'delete': instance.delete,
  'scope': instance.scope,
  'exercise': instance.exercise.toJson(),
  'generalInfo': instance.generalInfo.toJson(),
  'about': instance.about.toJson(),
  'task': instance.task.toJson(),
  'attachedFile': instance.attachedFile.toJson(),
  'organization': instance.organization.toJson(),
  'participant': instance.participant.toJson(),
  'activity': instance.activity.toJson(),
};

UserManagements _$UserManagementsFromJson(Map<String, dynamic> json) =>
    UserManagements(
      view: json['view'] as bool,
      create: json['create'] as bool,
      edit: json['edit'] as bool,
      delete: json['delete'] as bool,
      scope: json['scope'] as String,
      users: Dashboard.fromJson(json['users'] as Map<String, dynamic>),
      rolesAndPermission: Dashboard.fromJson(
        json['rolesAndPermission'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserManagementsToJson(UserManagements instance) =>
    <String, dynamic>{
      'view': instance.view,
      'create': instance.create,
      'edit': instance.edit,
      'delete': instance.delete,
      'scope': instance.scope,
      'users': instance.users.toJson(),
      'rolesAndPermission': instance.rolesAndPermission.toJson(),
    };
