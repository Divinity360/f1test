import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/team_helper.dart';
import 'package:flutter_app/models/custom_team_model.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/team_provider.dart';
import 'package:flutter_app/screens/mobile/empty_screen.dart';
import 'package:flutter_app/widgets/team_rename_bottom_widget.dart';
import 'package:flutter_app/screens/mobile/team_screen.dart';
import 'package:flutter_app/widgets/topic_mobile_appbar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppProvider _appProvider;
  final _pageController = PageController(initialPage: 0, viewportFraction: 0.9);

  @override
  void initState() {
    _appProvider = Provider.of<AppProvider>(context, listen: false);
    _appProvider.processAppData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopicMobileAppBar(),
      body: Consumer2<TeamProvider, AppProvider>(
          builder: (context, teamState, appState, child) {
        final teamList = teamState.customTeamList;
        return appState.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemBuilder: (context, i) {
                        if (i < teamList.length) {
                          CustomTeam team = teamList.elementAt(i);
                          return TeamScreen(
                            team: team,
                            index: i + 1,
                            renameTeam: () => TeamHelper.renameBottomSheet(
                                i, context, teamState),
                            recreateTeam: () => teamState.recreateTeam(i),
                            replicateTeam: () =>
                                teamState.replicateTeam(team, i),
                            deleteTeam: () => teamState.deleteTeam(team),
                          );
                        } else {
                          return EmptyScreen(
                            action: () => teamState.buildTeam(context),
                            index: teamList.length + 1,
                          );
                        }
                      },
                      itemCount: min(teamList.length + 1, 3),
                    ),
                  ),
                ],
              );
      }),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


}
