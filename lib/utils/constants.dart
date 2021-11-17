class Constants {
  static const route_wmain = '/wmain';
  static const route_wplay_list = '/wplayer_list';
  static const route_wplay_detail = '/wplayer_detail';

  static const base_url =
      'https://fantasy-stage-api.formula1.com/partner_games/f1/';
  static const url_teams = '${base_url}teams';
  static const url_players = '${base_url}players';

  static const kFilterContents = [
    'Sort by Name A~Z',
    'Sort by Name Z~A',
    'Sort by Price Biggest',
    'Sort by Price Smallest',
    'Sort by Points',
  ];
}
