import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';

abstract class ConfirmDialog {
  static Future<bool> showConfirmDialog({
    
    required BuildContext context,
    required String title,
    required String message
    
    }) async {
    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(AppStrings.yes),
            ),
            CupertinoDialogAction(
              child: const Text(AppStrings.no),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}