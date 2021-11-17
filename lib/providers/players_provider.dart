import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/player_model.dart';
import 'package:flutter_app/models/team_model.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/enums.dart';

class PlayersProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Player> _apiPlayersList = [];
  late AppProvider appProvider;
  Player? _selectedPlayer;
  List<Player> _visiblePlayersList = [];
  FilterType _type = FilterType.ByNameAZ;

  bool get isLoading => _isLoading;

  List<Player> get apiPlayersList => _apiPlayersList;

  Player? get selectedPlayer => _selectedPlayer;

  FilterType get type => _type;

  List<Player> get visiblePlayersList => _visiblePlayersList;

  set selectedPlayer(Player? player) {
    _selectedPlayer = player;
    notifyListeners();
  }

  set type(FilterType type) {
    _type = type;
    notifyListeners();
  }

  set apiPlayersList(val) {
    _apiPlayersList = val;
    _visiblePlayersList.clear();
    _visiblePlayersList.addAll(val);
    notifyListeners();
  }

  set visiblePlayersList(val) {
    _visiblePlayersList = val;
    notifyListeners();
  }

  void filterUser(String search) {
    _visiblePlayersList.clear();

    _visiblePlayersList = _apiPlayersList
        .where((player) => player.displayName!.contains(search))
        .toList();

    switch (_type) {
      case FilterType.ByNameAZ:
        _visiblePlayersList.sort((a, b) => a.displayName!.compareTo(b.displayName!));
        break;
      case FilterType.ByPriceBig:
        _visiblePlayersList.sort((b, a) => double.parse(a.price!.toString())
            .compareTo(double.parse(b.price!.toString())));
        break;
      case FilterType.ByPoints:
        _visiblePlayersList.sort((a, b) => double.parse(a.positionId!.toString())
            .compareTo(double.parse(b.positionId!.toString())));
        break;
      case FilterType.ByNameZA:
        _visiblePlayersList.sort((a, b) => b.displayName!.compareTo(a.displayName!));
        break;
      case FilterType.ByPriceSmall:
        _visiblePlayersList.sort((b, a) => double.parse(b.price!.toString())
            .compareTo(double.parse(a.price!.toString())));
        break;
    }
    notifyListeners();
  }

  String getSortedName() {
    switch (_type) {
      case FilterType.ByNameAZ:
        return 'NAME';
        break;
      case FilterType.ByNameZA:
        return 'NAME';
        break;
      case FilterType.ByPriceBig:
        return 'PRICE';
        break;
      case FilterType.ByPriceSmall:
        return 'PRICE';
        break;
      case FilterType.ByPoints:
        return 'POINTS';
        break;
    }
  }




}
