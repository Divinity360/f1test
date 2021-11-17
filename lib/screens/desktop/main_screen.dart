import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/team_helper.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/team_provider.dart';
import 'package:flutter_app/screens/mobile/main_screen.dart';
import 'package:flutter_app/widgets/team_rename_bottom_widget.dart';
import 'package:flutter_app/widgets/topic_appbar.dart';
import 'package:flutter_app/screens/mobile/empty_screen.dart';
import 'package:flutter_app/screens/mobile/team_screen.dart';
import 'package:flutter_app/themes/dimens.dart';
import 'package:provider/provider.dart';

class NMainScreen extends StatefulWidget {
  const NMainScreen({Key? key}) : super(key: key);

  @override
  _NMainScreenState createState() => _NMainScreenState();
}

class _NMainScreenState extends State<NMainScreen> {
  late AppProvider _appProvider;

  @override
  void initState() {
    _appProvider = Provider.of<AppProvider>(context, listen: false);
    _appProvider.processAppData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopicAppBar(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Consumer2<TeamProvider, AppProvider>(
            builder: (context, teamState, appState, child) {
              final teamList = teamState.customTeamList;
              return Center(
                child: appState.isLoading
                    ? CircularProgressIndicator()
                    : Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.089),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0;
                                i < min(teamList.length + 1, 3);
                                i++)
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 90,
                                child: i < teamList.length
                                    ? TeamScreen(
                                        team: teamList.elementAt(i),
                                        index: i + 1,
                                        renameTeam: () =>
                                            TeamHelper.renameBottomSheet(
                                                i,
                                                context,
                                                teamState),
                                        recreateTeam: () =>
                                            teamState.recreateTeam(
                                                i),
                                        replicateTeam: () =>
                                            teamState.replicateTeam(
                                                teamList.elementAt(i), i),
                                        deleteTeam: () => teamState
                                            .deleteTeam(teamList.elementAt(i)),
                                      )
                                    : EmptyScreen(
                                        action: () =>
                                            teamState.buildTeam(context),
                                        index: teamList.length + 1,
                                      ),
                              ),
                          ],
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
