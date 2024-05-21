// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      nickname: json['nickname'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'nickname': instance.nickname,
      'uid': instance.uid,
    };
