import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../authentication/presentation/controller/authentication_bloc.dart';
import '../../../authentication/presentation/controller/authentication_state.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<AuthenticationBloc>(),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return const SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            );
          },
        ));
  }
}
