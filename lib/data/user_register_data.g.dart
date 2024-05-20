// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterData _$UserRegisterDataFromJson(Map<String, dynamic> json) =>
    UserRegisterData(
      json['email'] as String,
      json['name'] as String,
      json['surname'] as String,
      json['nickname'] as String,
    );

Map<String, dynamic> _$UserRegisterDataToJson(UserRegisterData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'nickname': instance.nickname,
    };
