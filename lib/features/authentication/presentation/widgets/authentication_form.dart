import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../controller/authentication_bloc.dart';
import '../controller/authentication_event.dart';
import '../controller/authentication_state.dart';
import 'authentication_form_password_field.dart';
import 'authentication_form_user_name_field.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({
    super.key,
  });

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthenticationFormUserNameField(usernameController: _usernameController),
      
            const SizedBox(height: AppDimensions.eightDimension),
      
            AuthenticationFormPasswordField( passwordController: _passwordController,),
      
            const SizedBox(height: AppDimensions.eightDimension),
      
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: getIt<AuthenticationBloc>(),
              builder: (context , state) {
                return ElevatedButton(
                  // set the button to disabled while the request is loading
                  onPressed: state is AuthenticationLoading ?  null : _sendRequest,
                  child: const Text(AppStrings.login),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  void _sendRequest() {
    if (_formKey.currentState!.validate()) {
      _login(userName: _usernameController.text , password: _passwordController.text);
    }
  }

  void _login({required String userName , required String password}) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<AuthenticationBloc>().add(LoginEvent(  userName: userName,  password: password ));
  }
}
