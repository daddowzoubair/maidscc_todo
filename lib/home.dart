import 'package:flutter/material.dart';
import 'package:maidscc_todos/core/utils/shared_pref.dart';
import 'package:maidscc_todos/features/authentication/data/repositories/authentication_reporsitory_imp.dart';
import 'package:maidscc_todos/features/authentication/data/repositories/authentication_repository.dart';

import 'core/service_locator/service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String message = 'hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message),
            const FlutterLogo(),
            ElevatedButton(onPressed: ()async {
              setState(() {
                message = 'wait';
              });

             // final responce  = await getIt<AuthenticationRepository>().login(userName: 'emilys', password: 'emilyspass');

              final userInfoResponce  = await getIt<AuthenticationRepository>().userInfo();

              setState(() {
                message = userInfoResponce.address.address;
              });

            }, child: const Text('Save Data'))
          ],
        ),
      ),
    );
  }
}
