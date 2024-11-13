// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      maidenName: json['maidenName'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      gender: json['gender'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
      image: json['image'] as String? ?? '',
      bloodGroup: json['bloodGroup'] as String? ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      eyeColor: json['eyeColor'] as String? ?? '',
      hair: json['hair'] == null
          ? const Hair()
          : Hair.fromJson(json['hair'] as Map<String, dynamic>),
      ip: json['ip'] as String? ?? '',
      address: json['address'] == null
          ? const Address()
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String? ?? '',
      university: json['university'] as String? ?? '',
      bank: json['bank'] == null
          ? const Bank()
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      company: json['company'] == null
          ? const Company()
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String? ?? '',
      ssn: json['ssn'] as String? ?? '',
      userAgent: json['userAgent'] as String? ?? '',
      crypto: json['crypto'] == null
          ? const Crypto()
          : Crypto.fromJson(json['crypto'] as Map<String, dynamic>),
      role: json['role'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthDate': instance.birthDate,
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hair': instance.hair,
      'ip': instance.ip,
      'address': instance.address,
      'macAddress': instance.macAddress,
      'university': instance.university,
      'bank': instance.bank,
      'company': instance.company,
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
      'crypto': instance.crypto,
      'role': instance.role,
      'message': instance.message,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      address: json['address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      stateCode: json['stateCode'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      coordinates: json['coordinates'] == null
          ? const Coordinates()
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'stateCode': instance.stateCode,
      'postalCode': instance.postalCode,
      'coordinates': instance.coordinates,
      'country': instance.country,
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$BankImpl _$$BankImplFromJson(Map<String, dynamic> json) => _$BankImpl(
      cardExpire: json['cardExpire'] as String? ?? '',
      cardNumber: json['cardNumber'] as String? ?? '',
      cardType: json['cardType'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      iban: json['iban'] as String? ?? '',
    );

Map<String, dynamic> _$$BankImplToJson(_$BankImpl instance) =>
    <String, dynamic>{
      'cardExpire': instance.cardExpire,
      'cardNumber': instance.cardNumber,
      'cardType': instance.cardType,
      'currency': instance.currency,
      'iban': instance.iban,
    };

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      department: json['department'] as String? ?? '',
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      address: json['address'] == null
          ? const Address()
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'name': instance.name,
      'title': instance.title,
      'address': instance.address,
    };

_$CryptoImpl _$$CryptoImplFromJson(Map<String, dynamic> json) => _$CryptoImpl(
      coin: json['coin'] as String? ?? '',
      wallet: json['wallet'] as String? ?? '',
      network: json['network'] as String? ?? '',
    );

Map<String, dynamic> _$$CryptoImplToJson(_$CryptoImpl instance) =>
    <String, dynamic>{
      'coin': instance.coin,
      'wallet': instance.wallet,
      'network': instance.network,
    };

_$HairImpl _$$HairImplFromJson(Map<String, dynamic> json) => _$HairImpl(
      color: json['color'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$HairImplToJson(_$HairImpl instance) =>
    <String, dynamic>{
      'color': instance.color,
      'type': instance.type,
    };
