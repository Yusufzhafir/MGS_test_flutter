//profileName 64
//Username 50
//Password 50
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "profileName") required String profileName,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "password") required String password,
  }) = _Usermodel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
