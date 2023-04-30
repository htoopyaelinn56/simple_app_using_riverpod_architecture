import 'package:flutter/material.dart';

void showCommonSnackBar({required BuildContext context, required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  ));
}
