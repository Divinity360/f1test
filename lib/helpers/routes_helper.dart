import 'package:flutter/material.dart';
import 'package:flutter_app/screens/desktop/main_screen.dart';
import 'package:flutter_app/screens/desktop/player_detail_page.dart';
import 'package:flutter_app/screens/desktop/player_list_screen.dart';
import 'package:flutter_app/screens/mobile/player_detail_page.dart';
import 'package:flutter_app/screens/mobile/player_list_screen.dart';
import 'package:flutter_app/utils/responsive.dart';
import 'package:flutter_app/screens/mobile/main_screen.dart';
import 'package:flutter_app/utils/constants.dart';

class RoutesHelper {
  static Route<dynamic>?  generateRoute(settings) {
    if (settings.name == Constants.route_wmain) {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            Responsive(
                mobile: MainScreen(),
                tablet: MainScreen(),
                desktop: NMainScreen()),
      );
    } else if (settings.name == Constants.route_wplay_list) {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            Responsive(
                mobile: PlayerListScreen(),
                tablet: PlayerListScreen(),
                desktop: NPlayerListScreen()),
      );
    } else if (settings.name == Constants.route_wplay_detail) {
      return PageRouteBuilder(
        opaque: false, // set to false
        pageBuilder: (_, __, ___) =>
            Responsive(
                mobile: PlayerDetailPage(),
                tablet: PlayerDetailPage(),
                desktop: MPlayerDetailPage()),
      );
    }
  }
}
