import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/team_helper.dart';
import 'package:flutter_app/models/custom_team_model.dart';
import 'package:flutter_app/models/player_model.dart';
import 'package:flutter_app/models/team_model.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:provider/provider.dart';

class TeamProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Team> _apiTeamList = [];
  List<CustomTeam> _customTeamList = [];
  late PlayersProvider playersProvider;

  bool get isLoading => _isLoading;

  List<Team> get apiTeamList => _apiTeamList;

  List<CustomTeam> get customTeamList => _customTeamList;

  set apiTeamList(val) {
    _apiTeamList = val;
    notifyListeners();
  }


  buildTeam(context) {
    playersProvider = Provider.of<PlayersProvider>(context, listen: false);
    List<Player> playerList =
        TeamHelper.createTeam(playerList: playersProvider.apiPlayersList);
    _customTeamList.add(
      CustomTeam(name: "Team name", playerList: playerList),
    );
    notifyListeners();
  }

  deleteTeam(CustomTeam team) {
    _customTeamList.remove(team);
    notifyListeners();
  }

  recreateTeam(int index) {
    List<Player> playerList =
    TeamHelper.createTeam(playerList: playersProvider.apiPlayersList);
    _customTeamList[index] =  CustomTeam(name: "Team name", playerList: playerList);
    notifyListeners();
  }

  renameTeam(int index, String teamName) {
    _customTeamList.elementAt(index).name = teamName;
    notifyListeners();
  }

  replicateTeam(CustomTeam team, int index) {
    if (_customTeamList.length < 3) {
      _customTeamList.insert(index + 1, team);
    }
    notifyListeners();
  }
}
