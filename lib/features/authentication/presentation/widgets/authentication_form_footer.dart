import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../controller/authentication_bloc.dart';
import '../controller/authentication_state.dart';

class AuthenticationFormFooter extends StatelessWidget {
  const AuthenticationFormFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
        return Expanded(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: state is AuthenticationLoading,
                    child: const Center(child: CircularProgressIndicator(),)),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: state is AuthenticationFailure,
                  child: Text('${AppStrings.error} ${state is AuthenticationFailure ? state.error : ""}' , maxLines: 2, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error ), )),
              ],
            ),
          ),
        );
      }
    );
  }
}
