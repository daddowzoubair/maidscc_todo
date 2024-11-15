import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoDetailsFormTitleField extends StatelessWidget {
  const TodoDetailsFormTitleField({
    super.key,
    required TextEditingController todoController,
  }) : _todoController = todoController;

  final TextEditingController _todoController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.longTextFormFieldHeight,
      child: TextFormField(
        controller: _todoController,
        minLines: 3,
        maxLines: 3,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        enableSuggestions: true,
        decoration: const InputDecoration(
          hintText: AppStrings.todoHint,
          labelText: AppStrings.todoLabel,
          prefixIcon: Icon(CupertinoIcons.t_bubble),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.todoValidation;
          }
          return null;
        },
      ),
    );
  }
}

