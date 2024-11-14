import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';

class AuthenticationFormPasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const AuthenticationFormPasswordField(
      {super.key, required this.passwordController});

  @override
  State<AuthenticationFormPasswordField> createState() =>
      _AuthenticationFormPasswordFieldState();
}

class _AuthenticationFormPasswordFieldState
    extends State<AuthenticationFormPasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.textFormFieldHeight,
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: _obscurePassword,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        enableSuggestions: false,
        decoration: InputDecoration(
          hintText: AppStrings.passwordHint,
          labelText: AppStrings.passwordLabel,
          prefixIcon: const Icon(CupertinoIcons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.passwordValidation;
          }
          return null;
        },
      ),
    );
  }
}
