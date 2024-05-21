import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_data.freezed.dart';
part 'message_data.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
class MessageData with _$MessageData {
  const factory MessageData(
      {required String senderId,
      required String receiverId,
      required String senderEmail,
      required String message,
      @TimestampConverter() required DateTime timestamp}) = _MessageData;

  factory MessageData.fromJson(Map<String, Object?> json) =>
      _$MessageDataFromJson(json);
}
