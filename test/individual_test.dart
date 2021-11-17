

import 'dart:math';

import 'package:flutter_app/helpers/team_helper.dart';
import 'package:flutter_app/models/player_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing App Models', () {
    var random = Random.secure();
    List<Player> players = TeamHelper.generateRandomPlayers(10);

    test('Players list should not be empty', () {
      expect(players.isNotEmpty, true);
    });

    test('Players list should be contain player models', () {
      expect(players.every((n) => n is Player), true);
    });

    test('Players position field should contain Position enum ', () {
      expect(players.every((n) => n.position is Position), true);
    });
  });
}
