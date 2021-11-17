import 'package:flutter/material.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/widgets/primary_button.dart';

class TeamRenameBottomWidget extends StatefulWidget {
  final Function(String text)? onRenameBtnPressed;
  final int index;

  const TeamRenameBottomWidget({
    Key? key,
    required this.onRenameBtnPressed,
    required this.index,
  }) : super(key: key);

  @override
  _TeamRenameBottomWidgetState createState() => _TeamRenameBottomWidgetState();
}

class _TeamRenameBottomWidgetState extends State<TeamRenameBottomWidget> {
  String _textInput = '';
  bool _showErrorText = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
          child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 12),
              child: Text(
                'RENAME TEAM ${widget.index + 1}',
                style: TextStyle(fontSize: 13, color: Color(0xff5F6C84)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, top: 8, right: 12, bottom: 5),
                child: Stack(alignment: Alignment(1.0, 0.0), // right & center
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          setState(() => _textInput = value);
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Type team name",
                          hintStyle: TextStyle(color: Color(0xffBABABA)),
                          isDense: true),
                      ),
                      Positioned(
                        child: _textInput.isEmpty
                            ? Container()
                            : Icon(
                                Icons.check,
                                color: POColors.accentColor,
                              ),
                      )
                    ])),
            Visibility(
              visible: _showErrorText,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                  left: 12.0,
                ),
                child: Text(
                  'Lorem ipsum sit amet.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffEE5350)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 19),
                    child: PrimaryButton(
                        text: "Rename",
                        isEnabled: _textInput.isNotEmpty,
                        action: () {
                          if (_textInput.isNotEmpty) {
                            widget.onRenameBtnPressed!(_textInput);
                            Navigator.pop(context);
                          } else {
                            setState(() => _showErrorText = true);
                          }
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ));
    });
  }
}
