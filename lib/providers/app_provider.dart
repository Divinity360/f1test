import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/network_helper.dart';
import 'package:flutter_app/models/player_model.dart';
import 'package:flutter_app/models/team_model.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/providers/team_provider.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  processAppData(BuildContext context) async {
    await processTeamData(context);
    await processPlayersData(context);
    setLoader(false);
  }

  Future<void> processTeamData(BuildContext context) async {
    final _teamModel = Provider.of<TeamProvider>(context, listen: false);
    var res = await NetworkHelper.get(Constants.url_teams);
    if (res != null) _teamModel.apiTeamList = teamListFromJson(res);
  }

  Future<void> processPlayersData(BuildContext context) async {
    final _playersModel = Provider.of<PlayersProvider>(context, listen: false);
    var res = await NetworkHelper.get(Constants.url_players);
    if (res != null) _playersModel.apiPlayersList = playerListFromJson(res);
  }
}
