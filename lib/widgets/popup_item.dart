import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const PopupItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20,),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 50),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15, color: Colors.black),
          ),
        )
      ],
    );
  }
}
