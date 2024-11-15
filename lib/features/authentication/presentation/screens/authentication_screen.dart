import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/app_dimensions.dart';
import '../controller/authentication_bloc.dart';
import '../controller/authentication_state.dart';
import '../widgets/authentication_app_logo.dart';
import '../widgets/authentication_form.dart';
import '../widgets/authentication_form_footer.dart';
import '../widgets/user_profile_info.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.sixteenDimension),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is UserInfoLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // app logo
                  AuthenticationLogo(userImage: state.userInfo.image,),
                  // authentication form
                  UserProfileInfo(userInfo: state.userInfo),
                ],
              );
            } else {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // app logo
                  AuthenticationLogo(),
                  // authentication form
                  AuthenticationForm(),
                  // form footer
                  AuthenticationFormFooter(),
                ],
              );
            }
          }),
        );
  }
}
