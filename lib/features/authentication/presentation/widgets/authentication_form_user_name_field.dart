import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationFormUserNameField extends StatelessWidget {
  const AuthenticationFormUserNameField({
    super.key,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.textFormFieldHeight,
      child: TextFormField(
        controller: _usernameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        enableSuggestions: true,
        decoration: const InputDecoration(
          hintText: AppStrings.userNameHint,
          labelText: AppStrings.userNameLabel,
          prefixIcon: Icon(CupertinoIcons.person),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.userNameValidation;
          }
          return null;
        },
      ),
    );
  }
}
