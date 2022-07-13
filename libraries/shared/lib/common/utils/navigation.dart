import 'package:flutter/material.dart';

class Navigation {
  //TODO : For Calling Up a Previous Screen Without Triggering
  static back(BuildContext context) {
    Navigator.pop(context);
  }

  //TODO : For Calling Up A Screen Using Parameter Name
  static intent(BuildContext context, String nameRouted) {
    Navigator.pushNamed(context, nameRouted);
  }

  //TODO : For Calling Up A Screen By Using The Parameter Name And Discarding The Previous Screen
  static intentWithoutBack(BuildContext context, String nameRouted) {
    Navigator.pushReplacementNamed(context, nameRouted);
  }

  //TODO : For Calling Up A Screen By Removing All Previously Called Screens
  static intentWithClearAllRoutes(BuildContext context, String nameRouted) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(nameRouted, (Route<dynamic> route) => false);
  }

  //TODO : For Calling A Screen With Data (String, Int, Boolean, etc)
  static intentWithData(
      BuildContext context, String nameRouted, Object argumentClass) {
    Navigator.pushNamed(context, nameRouted, arguments: argumentClass);
  }
}
