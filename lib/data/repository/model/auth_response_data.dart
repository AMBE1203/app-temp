import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_data.freezed.dart';
part 'auth_response_data.g.dart';

@freezed
class AuthResponseData with _$AuthResponseData {
  const factory AuthResponseData({
    @JsonKey(name: 'access_token') String? accessToken,
    // @JsonKey(name: 'id') String? id,
    // @JsonKey(name: 'email') String? email,
    // @JsonKey(name: 'username') String? username,
    // @JsonKey(name: 'name') String? name,
    // @JsonKey(name: 'gender') String? gender,
    // @JsonKey(name: 'age_range') String? ageRange,
    // firebase
    @JsonKey(name: 'uid') String? uid,
    @JsonKey(name: 'idToken') String? idToken,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'refreshToken') String? refreshToken,
    @JsonKey(name: 'expiresIn') String? expiresIn,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'registered') bool? registered,
  }) = _AuthResponseData;

  factory AuthResponseData.fromJson(Map<String, dynamic> json) => _$AuthResponseDataFromJson(json);
}
