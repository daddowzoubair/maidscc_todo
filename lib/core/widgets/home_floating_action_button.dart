import '../../features/authentication/presentation/controller/authentication_bloc.dart';
import '../../features/authentication/presentation/controller/authentication_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/todos/presentation/screens/todo_details.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: tabController,
      builder: (context, child) =>
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
        return AnimatedCrossFade(
          duration: Durations.medium2,
          alignment: Alignment.center,
          crossFadeState: state is UserInfoLoaded && tabController.index == 1
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: FloatingActionButton(
            onPressed: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => const TodoDetailsScreen()));
            },
            child: const Icon(CupertinoIcons.add_circled_solid),
          ),
          secondChild: const SizedBox.shrink(),
        );
      }),
    );
  }
}
