import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/navigator_helper.dart';
import 'package:flutter_app/screens/mobile/player_list_screen.dart';
import 'package:flutter_app/themes/dimens.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopicAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 50),
    child: Text('Teams',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
      actions: [
        IconButton(
          icon: Icon(Icons.person_outline_sharp),
          onPressed: () => NavigatorHelper.of(context)
              .navigateNamedTo(screen: Constants.route_wplay_list),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
