import 'package:json_annotation/json_annotation.dart';
part 'login_res.g.dart';

@JsonSerializable()
class UserRes {

  UserRes({this.accessToken, this.refreshToken, this.data});

  factory UserRes.fromJson(Map<String, dynamic> json) =>
      _$UserResFromJson(json);
  Map<String, dynamic> toJson() => _$UserResToJson(this);

  @JsonKey(name: 'token')
  String accessToken;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  @JsonKey(name: 'errorCode')
  String errorCode;

  @JsonKey(name: 'data')
  User data;
}

@JsonSerializable()
class User {
  User({this.id,
    this.email,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.avatar,
    this.addressId,
    this.companyId,
    this.languageId,
    this.departmentId,
    this.status,
    this.createdTime,
    this.lastUpdate,
    this.forgotPassword,
    this.delete});

   static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
   Map<String, dynamic> toJson() => _$UserToJson(this);

   @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'middleName')
  String middleName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'addressId')
  int addressId;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'languageId')
  int languageId;

  @JsonKey(name: 'departmentId')
  int departmentId;

  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'createdTime')
  String createdTime;

  @JsonKey(name: 'lastUpdate')
  String lastUpdate;

  @JsonKey(name: 'forgotPassword')
  bool forgotPassword;

  @JsonKey(name: 'delete')
  bool delete;


}
