import 'package:json_annotation/json_annotation.dart';
part 'login_req.g.dart';

@JsonSerializable()
class LoginReq {

  LoginReq({this.email,this.password});


  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      _$LoginReqFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqToJson(this);

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;
}
