import '../../../../constants/app_strings.dart';
import '../../data/entities/user_info/user_info_model.dart';
import 'package:flutter/material.dart';

import 'user_profile_info_card.dart';

class UserProfileInfo extends StatelessWidget {
  final UserInfoModel userInfo;
  const UserProfileInfo({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserProfileInfoCard(
            title: AppStrings.personalInformation,
            info: [
              "${AppStrings.name}: ${userInfo.firstName} ${userInfo.lastName} (${AppStrings.maidenName}: ${userInfo.maidenName})",
              "${AppStrings.username}: ${userInfo.username}",
              "${AppStrings.age}: ${userInfo.age}",
              "${AppStrings.gender}: ${userInfo.gender}",
              "${AppStrings.birthDate}: ${userInfo.birthDate}",
              "${AppStrings.role}: ${userInfo.role}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.contactDetails,
            info: [
              "${AppStrings.email}: ${userInfo.email}",
              "${AppStrings.phone}: ${userInfo.phone}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.physicalAttributes,
            info: [
              "${AppStrings.height}: ${userInfo.height} ${AppStrings.heightUnit}",
              "${AppStrings.weight}: ${userInfo.weight} ${AppStrings.weightUnit}",
              "${AppStrings.eyeColor}: ${userInfo.eyeColor}",
              "${AppStrings.hair}: ${userInfo.hair.color} (${userInfo.hair.type})",
              "${AppStrings.bloodGroup}: ${userInfo.bloodGroup}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.address,
            info: [
              "${AppStrings.address}: ${userInfo.address.address}",
              "${AppStrings.city}: ${userInfo.address.city}, ${userInfo.address.state}",
              "${AppStrings.postalCode}: ${userInfo.address.postalCode}",
              "${AppStrings.country}: ${userInfo.address.country}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.companyInformation,
            info: [
              "${AppStrings.companyName}: ${userInfo.company.name}",
              "${AppStrings.title}: ${userInfo.company.title}",
              "${AppStrings.department}: ${userInfo.company.department}",
              "${AppStrings.officeAddress}: ${userInfo.company.address.address}, ${userInfo.company.address.city}, ${userInfo.company.address.state}",
              "${AppStrings.postalCode}: ${userInfo.company.address.postalCode}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.bankDetails,
            info: [
              "${AppStrings.cardType}: ${userInfo.bank.cardType}",
              "${AppStrings.cardNumber}: ${userInfo.bank.cardNumber}",
              "${AppStrings.cardExpire}: ${userInfo.bank.cardExpire}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.cryptoWallet,
            info: [
              "${AppStrings.coin}: ${userInfo.crypto.coin}",
              "${AppStrings.walletAddress}: ${userInfo.crypto.wallet}",
              "${AppStrings.network}: ${userInfo.crypto.network}",
            ],
          ),
          UserProfileInfoCard(
            title: AppStrings.education,
            info: [
              "${AppStrings.university}: ${userInfo.university}",
            ],
          ),
        ],
      ),
    );
  }
}
