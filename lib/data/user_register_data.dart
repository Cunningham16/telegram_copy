import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_data.g.dart';

@JsonSerializable()
class UserRegisterData extends Equatable {
  const UserRegisterData(this.email, this.name, this.surname, this.nickname);

  final String email;
  final String name;
  final String surname;
  final String nickname;

  factory UserRegisterData.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterDataToJson(this);

  @override
  List<Object?> get props => [email];
}
