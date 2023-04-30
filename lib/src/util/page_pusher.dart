import 'package:flutter/material.dart';

void pagePush({
  required BuildContext context,
  required Widget page,
  bool removeBackStack = false,
}) {
  if (removeBackStack) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
