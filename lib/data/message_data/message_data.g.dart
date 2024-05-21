// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDataImpl _$$MessageDataImplFromJson(Map<String, dynamic> json) =>
    _$MessageDataImpl(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      senderEmail: json['senderEmail'] as String,
      message: json['message'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$MessageDataImplToJson(_$MessageDataImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'senderEmail': instance.senderEmail,
      'message': instance.message,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
