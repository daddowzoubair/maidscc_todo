import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/app_strings.dart';
import 'constants/app_themes.dart';
import 'core/service_locator/service_locator.dart';
import 'features/authentication/presentation/controller/authentication_bloc.dart';
import 'features/todos/presentation/controller/todos_bloc.dart';
import 'features/todos/presentation/controller/todos_event.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init service locator
  await initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //bloc multi providers
    return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>( create: (BuildContext context) => AuthenticationBloc(),),
            // Fetch the todo list when the application starts
            BlocProvider<TodosBloc>( create: (BuildContext context) => getIt<TodosBloc>()..add(FetchTodoListEvent()),),
          ],
          child: MaterialApp(
        title: AppStrings.appTitle,
        theme: AppThemes.lightTheme(context),
        home:  const HomeScreen()
        ),
      
    );
  }
}
