import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/primary_button.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/themes/dimens.dart';

class EmptyScreen extends Card {
  EmptyScreen({
    required int index,
    required Function() action,
  }) : super(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dimenCorner),
          ),
          shadowColor: POColors.shadowColor,
          elevation: 5,
          child: Center(
              child: PrimaryButton(action: action, text: 'Create Team $index')),
        );
}
