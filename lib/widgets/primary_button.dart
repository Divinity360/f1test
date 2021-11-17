import 'package:flutter/material.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/themes/dimens.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? action;
  final String text;
  final bool isEnabled;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.action,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor( height: 30),
    child:  ElevatedButton(
        onPressed: action,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return !isEnabled || states.contains(MaterialState.disabled)
                ? Color(0xffD8D8D8)
                : POColors.accentColor; // Use the component's default.
          },
        ))));
  }
}
