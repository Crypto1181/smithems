import 'package:flutter/material.dart';

class NavigationHelper {
  static void pushReplacementInstant(BuildContext context, Widget route) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
