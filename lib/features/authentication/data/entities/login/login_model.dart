
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enum/gender.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';


@freezed
class LoginModel with _$LoginModel {
    const factory LoginModel({
        @Default('') String accessToken,
        @Default('') String refreshToken,
        @Default(0) int id,
        @Default('') String username,
        @Default('') String email,
        @Default('') String firstName,
        @Default('') String lastName,
        @Default(UserGender.none) UserGender gender,
        @Default('') String image,
        @Default('') String message
    }) = _LoginModel;

    factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}
