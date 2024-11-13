

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
    const factory UserInfoModel({
        @Default(0) int id,
        @Default('') String firstName,
        @Default('') String lastName,
        @Default('') String maidenName,
        @Default(0) int age,
        @Default('') String gender,
        @Default('') String email,
        @Default('') String phone,
        @Default('') String username,
        @Default('') String password,
        @Default('') String birthDate,
        @Default('') String image,
        @Default('') String bloodGroup,
        @Default(0.0) double height,
        @Default(0.0) double weight,
        @Default('') String eyeColor,
        @Default(Hair()) Hair hair,
        @Default('') String ip,
        @Default(Address()) Address address,
        @Default('') String macAddress,
        @Default('') String university,
        @Default(Bank()) Bank bank,
        @Default(Company()) Company company,
        @Default('') String ein,
        @Default('') String ssn,
        @Default('') String userAgent,
        @Default(Crypto()) Crypto crypto,
        @Default('') String role,
        @Default('') String message,
    }) = _UserInfoModel;

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => _$UserInfoModelFromJson(json);
}

@freezed
class Address with _$Address {
    const factory Address({
        @Default('') String address,
        @Default('') String city,
        @Default('') String state,
        @Default('') String stateCode,
        @Default('') String postalCode,
        @Default(Coordinates()) Coordinates coordinates,
        @Default('') String country,
    }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
    const factory Coordinates({
        @Default(0.0) double lat,
        @Default(0.0) double lng,
    }) = _Coordinates;

    factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
}

@freezed
class Bank with _$Bank {
    const factory Bank({
        @Default('') String cardExpire,
        @Default('') String cardNumber,
        @Default('') String cardType,
        @Default('') String currency,
        @Default('') String iban,
    }) = _Bank;

    factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}

@freezed
class Company with _$Company {
    const factory Company({
        @Default('') String department,
        @Default('') String name,
        @Default('') String title,
        @Default(Address()) Address address,
    }) = _Company;

    factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

@freezed
class Crypto with _$Crypto {
    const factory Crypto({
        @Default('') String coin,
        @Default('') String wallet,
        @Default('') String network,
    }) = _Crypto;

    factory Crypto.fromJson(Map<String, dynamic> json) => _$CryptoFromJson(json);
}

@freezed
class Hair with _$Hair {
    const factory Hair({
        @Default('') String color,
        @Default('') String type,
    }) = _Hair;

    factory Hair.fromJson(Map<String, dynamic> json) => _$HairFromJson(json);
}
