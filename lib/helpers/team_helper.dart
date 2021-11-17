import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/player_model.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/providers/team_provider.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/enums.dart';
import 'package:flutter_app/widgets/team_rename_bottom_widget.dart';

class TeamHelper {
  static List<Player> createTeam({required List<Player> playerList}) {
    final budgetFilteredPlayerList =
        playerList.where((element) => element.price! <= 100).toList();
    List<Player> selectedDriversList =
        processDriversList(budgetFilteredPlayerList);

    Player selectedConstructor = processConstructor(budgetFilteredPlayerList);

    return [...selectedDriversList, selectedConstructor];
  }

  static Player processConstructor(List<Player> playerList) {
    final allConstructorsList = playerList
        .where((element) => element.position == Position.CONSTRUCTOR)
        .toList();
    final selectedConstructor = (allConstructorsList..shuffle()).first;
    return selectedConstructor;
  }

  static List<Player> processDriversList(List<Player> playerList) {
    final allDriversList = playerList
        .where((element) => element.position == Position.DRIVER)
        .toList();
    final selectedDriversList = allDriversList.sublist(0, 5)..shuffle();
    return selectedDriversList;
  }

  static renameBottomSheet(
      int index, BuildContext context, TeamProvider teamState) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (_) => TeamRenameBottomWidget(
        onRenameBtnPressed: (text) {
          teamState.renameTeam(index, text);
        },
        index: index,
      ),
    );
  }

  static showBottomFilterMenu(
      BuildContext context, String search, PlayersProvider playersProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (_) => Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: POColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 24.0,
                ),
                Text(
                  'Filter By',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Icon(Icons.clear),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            for (var content in Constants.kFilterContents)
              Padding(
                child: InkWell(
                  onTap: () {
                    playersProvider.type = getFilterType(
                        Constants.kFilterContents.indexOf(content));
                    playersProvider.filterUser(search);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 24.0,
                      ),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Constants.kFilterContents.indexOf(content) ==
                              getSortedIndex(playersProvider.type)
                          ? Icon(
                              Icons.check,
                              color: POColors.green,
                            )
                          : Container(
                              width: 24.0,
                            ),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(16.0),
              ),
          ],
        ),
      ),
    );
  }

  static String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static List<Player> generateRandomPlayers(int len) {
    var random = Random.secure();
    return List<Player>.generate(
        len,
        (i) => Player(
            id: random.nextInt(255),
            teamName: TeamHelper.getRandString(10),
            lastName: TeamHelper.getRandString(10),
            firstName: TeamHelper.getRandString(10),
            position: random.nextInt(255) % 2 == 1
                ? Position.CONSTRUCTOR
                : Position.DRIVER));
  }
}
