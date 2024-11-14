
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_blur_radius.dart';
import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_offsets.dart';
import '../../../../constants/app_radius.dart';
import 'package:flutter/material.dart';

class AuthenticationLogo extends StatelessWidget {
  final String userImage;
  const AuthenticationLogo({
    this.userImage = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow:   const [
            BoxShadow(
              color: Colors.black12,
              offset: AppOffsets.fourByFourOffset,
              blurRadius: AppBlurRadius.fourBlurRadius
            )
          ],
          borderRadius: BorderRadius.circular(AppRadius.eightRadius)
        ),
        child: CachedNetworkImage(
              imageUrl: userImage,
              width: AppDimensions.eightyDimension,
              placeholder: (context, url) => Image.asset(AppAssets.logo , width: AppDimensions.eightyDimension,),
              errorWidget: (context, url, error) => Image.asset(AppAssets.logo , width: AppDimensions.eightyDimension,),
              )
        ),
      ),
    );
  }
}