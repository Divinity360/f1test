import 'package:flutter/material.dart';

class NavigatorHelper {
  final BuildContext context;

  NavigatorHelper(this.context);

  static NavigatorHelper of(BuildContext context) {
    return NavigatorHelper(context);
  }

  void navigateTo({
    required Widget screen,
    bool replace = false,
    bool opaque = true,
    Function(dynamic)? pop,
  }) {
    if (replace) {
      Navigator.of(context)
          .pushReplacement(
          MaterialPageRoute<Object>(builder: (context) => screen))
          .then((value) => {if (pop != null) pop(value)});
    } else if (opaque == true) {
      Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // set to false
            pageBuilder: (_, __, ___) => screen,
          )
      ).then((value) => {if (pop != null) pop(value)});
    }
    else {
      Navigator.of(context)
          .push(MaterialPageRoute<Object>(builder: (context) => screen))
          .then((value) => {if (pop != null) pop(value)});
    }
  }

  void navigateNamedTo({
    required String screen,
    bool replace = false,
    Function(dynamic)? pop,
  }) {
    if (replace) {
      Navigator.of(context)
          .pushReplacementNamed(screen)
          .then((value) => {if (pop != null) pop(value)});
    }
    else {
      Navigator.of(context)
          .pushNamed(screen)
          .then((value) => {if (pop != null) pop(value)});
    }
  }
}
