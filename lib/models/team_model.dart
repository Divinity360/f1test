List<Team> teamListFromJson(Map<String, dynamic> json) =>
    List<Team>.from(json["teams"].map((x) => Team.fromJson(x)));

class Team {
  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.slug,
    required this.founded,
    required this.manager,
    required this.assistantManager,
    required this.abbreviation,
    required this.jerseyImage,
    required this.teamLogoImage,
    required this.teamBadgeImage,
    required this.sportId,
    required this.showMarketingModal,
    required this.marketingModalText,
  });

  int id;
  String name;
  String shortName;
  String slug;
  dynamic founded;
  String manager;
  dynamic assistantManager;
  String abbreviation;
  Image jerseyImage;
  Image teamLogoImage;
  Image teamBadgeImage;
  int sportId;
  bool showMarketingModal;
  String marketingModalText;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        slug: json["slug"],
        founded: json["founded"],
        manager: json["manager"],
        assistantManager: json["assistant_manager"],
        abbreviation: json["abbreviation"],
        jerseyImage: Image.fromJson(json["jersey_image"]),
        teamLogoImage: Image.fromJson(json["team_logo_image"]),
        teamBadgeImage: Image.fromJson(json["team_badge_image"]),
        sportId: json["sport_id"],
        showMarketingModal: json["show_marketing_modal"],
        marketingModalText: json["marketing_modal_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "slug": slug,
        "founded": founded,
        "manager": manager,
        "assistant_manager": assistantManager,
        "abbreviation": abbreviation,
        "jersey_image": jerseyImage.toJson(),
        "team_logo_image": teamLogoImage.toJson(),
        "team_badge_image": teamBadgeImage.toJson(),
        "sport_id": sportId,
        "show_marketing_modal": showMarketingModal,
        "marketing_modal_text": marketingModalText,
      };
}

class Image {
  Image({
    required this.url,
  });

  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
