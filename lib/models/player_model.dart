List<Player> playerListFromJson(Map<String, dynamic> json) =>
    List<Player>.from(json["players"].map((x) => Player.fromJson(x)));

class Player {
  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.teamName,
    this.position,
    this.positionId,
    this.positionAbbreviation,
    this.price,
    this.currentPriceChangeInfo,
    this.status,
    this.injured,
    this.injuryType,
    this.banned,
    this.banType,
    this.streakEventsProgress,
    this.chanceOfPlaying,
    this.teamAbbreviation,
    this.weeklyPriceChange,
    this.weeklyPriceChangePercentage,
    this.teamId,
    this.headshot,
    this.knownName,
    this.jerseyImage,
    this.score,
    this.humanizeStatus,
    this.shirtNumber,
    this.country,
    this.isConstructor,
    this.seasonScore,
    this.driverData,
    this.constructorData,
    this.bornAt,
    this.seasonPrices,
    this.numFixturesInGameweek,
    this.deletedInFeed,
    this.hasFixture,
    this.displayName,
    this.externalId,
    this.profileImage,
    this.miscImage,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? teamName;
  final Position? position;
  final int? positionId;
  final PositionAbbreviation? positionAbbreviation;
  final double? price;
  final CurrentPriceChangeInfo? currentPriceChangeInfo;
  final dynamic status;
  final bool? injured;
  final dynamic injuryType;
  final bool? banned;
  final dynamic banType;
  final StreakEventsProgress? streakEventsProgress;
  final dynamic chanceOfPlaying;
  final String? teamAbbreviation;
  final double? weeklyPriceChange;
  final int? weeklyPriceChangePercentage;
  final int? teamId;
  final Headshot? headshot;
  final String? knownName;
  final Image? jerseyImage;
  final int? score;
  final dynamic humanizeStatus;
  final int? shirtNumber;
  final String? country;
  final bool? isConstructor;
  final dynamic seasonScore;
  final DriverData? driverData;
  final ConstructorData? constructorData;
  final DateTime? bornAt;
  final List<SeasonPrice>? seasonPrices;
  final int? numFixturesInGameweek;
  final bool? deletedInFeed;
  final bool? hasFixture;
  final String? displayName;
  final String? externalId;
  final Image? profileImage;
  final Image? miscImage;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        teamName: json["team_name"],
        position: positionValues.map[json["position"]],
        positionId: json["position_id"],
        positionAbbreviation:
            positionAbbreviationValues.map[json["position_abbreviation"]],
        price: json["price"].toDouble(),
        currentPriceChangeInfo:
            CurrentPriceChangeInfo.fromJson(json["current_price_change_info"]),
        status: json["status"],
        injured: json["injured"],
        injuryType: json["injury_type"],
        banned: json["banned"],
        banType: json["ban_type"],
        streakEventsProgress:
            StreakEventsProgress.fromJson(json["streak_events_progress"]),
        chanceOfPlaying: json["chance_of_playing"],
        teamAbbreviation: json["team_abbreviation"],
        weeklyPriceChange: json["weekly_price_change"].toDouble(),
        weeklyPriceChangePercentage: json["weekly_price_change_percentage"],
        teamId: json["team_id"],
        headshot: Headshot.fromJson(json["headshot"]),
        knownName: json["known_name"] == null ? null : json["known_name"],
        jerseyImage: Image.fromJson(json["jersey_image"]),
        score: json["score"],
        humanizeStatus: json["humanize_status"],
        shirtNumber: json["shirt_number"] == null ? null : json["shirt_number"],
        country: json["country"] == null ? null : json["country"],
        isConstructor: json["is_constructor"],
        seasonScore: json["season_score"],
        driverData: json["driver_data"] == null
            ? null
            : DriverData.fromJson(json["driver_data"]),
        constructorData: json["constructor_data"] == null
            ? null
            : ConstructorData.fromJson(json["constructor_data"]),
        bornAt:
            json["born_at"] == null ? null : DateTime.parse(json["born_at"]),
        seasonPrices: List<SeasonPrice>.from(
            json["season_prices"].map((x) => SeasonPrice.fromJson(x))),
        numFixturesInGameweek: json["num_fixtures_in_gameweek"],
        deletedInFeed: json["deleted_in_feed"],
        hasFixture: json["has_fixture"],
        displayName: json["display_name"],
        externalId: json["external_id"],
        profileImage: Image.fromJson(json["profile_image"]),
        miscImage: Image.fromJson(json["misc_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "team_name": teamName,
        "position": positionValues.reverse[position],
        "position_id": positionId,
        "position_abbreviation":
            positionAbbreviationValues.reverse[positionAbbreviation],
        "price": price,
        "current_price_change_info": currentPriceChangeInfo!.toJson(),
        "status": status,
        "injured": injured,
        "injury_type": injuryType,
        "banned": banned,
        "ban_type": banType,
        "streak_events_progress": streakEventsProgress!.toJson(),
        "chance_of_playing": chanceOfPlaying,
        "team_abbreviation": teamAbbreviation,
        "weekly_price_change": weeklyPriceChange,
        "weekly_price_change_percentage": weeklyPriceChangePercentage,
        "team_id": teamId,
        "headshot": headshot!.toJson(),
        "known_name": knownName == null ? null : knownName,
        "jersey_image": jerseyImage!.toJson(),
        "score": score,
        "humanize_status": humanizeStatus,
        "shirt_number": shirtNumber == null ? null : shirtNumber,
        "country": country == null ? null : country,
        "is_constructor": isConstructor,
        "season_score": seasonScore,
        "driver_data": driverData == null ? null : driverData!.toJson(),
        "constructor_data":
            constructorData == null ? null : constructorData!.toJson(),
        "born_at": bornAt == null
            ? null
            : "${bornAt!.year.toString().padLeft(4, '0')}-${bornAt!.month.toString().padLeft(2, '0')}-${bornAt!.day.toString().padLeft(2, '0')}",
        "season_prices":
            List<dynamic>.from(seasonPrices!.map((x) => x.toJson())),
        "num_fixtures_in_gameweek": numFixturesInGameweek,
        "deleted_in_feed": deletedInFeed,
        "has_fixture": hasFixture,
        "display_name": displayName,
        "external_id": externalId,
        "profile_image": profileImage!.toJson(),
        "misc_image": miscImage!.toJson(),
      };
}

class ConstructorData {
  ConstructorData({
    this.bestFinish,
    this.bestFinishCount,
    this.bestGrid,
    this.bestGridCount,
    this.titles,
    this.championshipPoints,
    this.firstSeason,
    this.poles,
    this.fastestLaps,
    this.country,
    this.highestRaceFinished,
  });

  final int? bestFinish;
  final int? bestFinishCount;
  final int? bestGrid;
  final int? bestGridCount;
  final int? titles;
  final double? championshipPoints;
  final String? firstSeason;
  final int? poles;
  final int? fastestLaps;
  final String? country;
  final String? highestRaceFinished;

  factory ConstructorData.fromJson(Map<String, dynamic> json) =>
      ConstructorData(
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        titles: json["titles"],
        championshipPoints: json["championship_points"].toDouble(),
        firstSeason: json["first_season"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        country: json["country"],
        highestRaceFinished: json["highest_race_finished"],
      );

  Map<String, dynamic> toJson() => {
        "best_finish": bestFinish,
        "best_finish_count": bestFinishCount,
        "best_grid": bestGrid,
        "best_grid_count": bestGridCount,
        "titles": titles,
        "championship_points": championshipPoints,
        "first_season": firstSeason,
        "poles": poles,
        "fastest_laps": fastestLaps,
        "country": country,
        "highest_race_finished": highestRaceFinished,
      };
}

class CurrentPriceChangeInfo {
  CurrentPriceChangeInfo({
    this.currentSelectionPercentage,
    this.probabilityPriceUpPercentage,
    this.probabilityPriceDownPercentage,
  });

  final int? currentSelectionPercentage;
  final int? probabilityPriceUpPercentage;
  final int? probabilityPriceDownPercentage;

  factory CurrentPriceChangeInfo.fromJson(Map<String, dynamic> json) =>
      CurrentPriceChangeInfo(
        currentSelectionPercentage: json["current_selection_percentage"],
        probabilityPriceUpPercentage: json["probability_price_up_percentage"],
        probabilityPriceDownPercentage:
            json["probability_price_down_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "current_selection_percentage": currentSelectionPercentage,
        "probability_price_up_percentage": probabilityPriceUpPercentage,
        "probability_price_down_percentage": probabilityPriceDownPercentage,
      };
}

class DriverData {
  DriverData({
    this.wins,
    this.podiums,
    this.poles,
    this.fastestLaps,
    this.grandsPrixEntered,
    this.titles,
    this.championshipPoints,
    this.bestFinish,
    this.bestFinishCount,
    this.bestGrid,
    this.bestGridCount,
    this.highestRaceFinished,
    this.placeOfBirth,
  });

  final int? wins;
  final int? podiums;
  final int? poles;
  final int? fastestLaps;
  final int? grandsPrixEntered;
  final int? titles;
  final int? championshipPoints;
  final int? bestFinish;
  final int? bestFinishCount;
  final int? bestGrid;
  final int? bestGridCount;
  final String? highestRaceFinished;
  final String? placeOfBirth;

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
        wins: json["wins"],
        podiums: json["podiums"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        grandsPrixEntered: json["grands_prix_entered"],
        titles: json["titles"],
        championshipPoints: json["championship_points"],
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        highestRaceFinished: json["highest_race_finished"],
        placeOfBirth: json["place_of_birth"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "podiums": podiums,
        "poles": poles,
        "fastest_laps": fastestLaps,
        "grands_prix_entered": grandsPrixEntered,
        "titles": titles,
        "championship_points": championshipPoints,
        "best_finish": bestFinish,
        "best_finish_count": bestFinishCount,
        "best_grid": bestGrid,
        "best_grid_count": bestGridCount,
        "highest_race_finished": highestRaceFinished,
        "place_of_birth": placeOfBirth,
      };
}

class Headshot {
  Headshot({
    this.profile,
    this.pitchView,
    this.playerList,
  });

  final String? profile;
  final String? pitchView;
  final String? playerList;

  factory Headshot.fromJson(Map<String, dynamic> json) => Headshot(
        profile: json["profile"],
        pitchView: json["pitch_view"],
        playerList: json["player_list"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "pitch_view": pitchView,
        "player_list": playerList,
      };
}

class Image {
  Image({
    this.url,
  });

  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
      };
}

enum Position { DRIVER, CONSTRUCTOR }

final positionValues = EnumValues(
    {"Constructor": Position.CONSTRUCTOR, "Driver": Position.DRIVER});

enum PositionAbbreviation { DR, CR }

final positionAbbreviationValues =
    EnumValues({"CR": PositionAbbreviation.CR, "DR": PositionAbbreviation.DR});

class SeasonPrice {
  SeasonPrice({
    this.gamePeriodId,
    this.price,
  });

  final int? gamePeriodId;
  final double? price;

  factory SeasonPrice.fromJson(Map<String, dynamic> json) => SeasonPrice(
        gamePeriodId: json["game_period_id"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "game_period_id": gamePeriodId,
        "price": price,
      };
}

class StreakEventsProgress {
  StreakEventsProgress();

  factory StreakEventsProgress.fromJson(Map<String, dynamic> json) =>
      StreakEventsProgress();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
