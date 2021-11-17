import 'package:flutter/material.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/widgets/player_detail_header.dart';
import 'package:provider/provider.dart';

class MPlayerDetailPage extends StatefulWidget {
  const MPlayerDetailPage({Key? key}) : super(key: key);

  @override
  _MPlayerDetailPageState createState() => _MPlayerDetailPageState();
}

class _MPlayerDetailPageState extends State<MPlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Center(child: Container(
          width: 320,
          height: MediaQuery.of(context).size.height * 0.85,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Color(0xff090124),
                Color(0xFF0B00EC),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child:  Consumer<PlayersProvider>(
            builder: (context, playerState, child) => Column(
              children: <Widget>[
                PlayerDetailHeader(player: playerState.selectedPlayer!),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Player status",
                        style: detailStyle,
                      ),
                      Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffFEC402),
                              radius: 3,
                            ),
                          ),
                          Text(
                            playerState.selectedPlayer!.injured!
                                ? "Injured"
                                : "Healthy",
                            style: detailStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Streak", style: detailStyle),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: Text("Q", style: detailStyle),
                          ),
                          StreakIcon(enabled: true),
                          StreakIcon(),
                          StreakIcon(),
                          Padding(
                            padding: EdgeInsets.only(left: 15,right: 3),
                            child: Text("R", style: detailStyle),
                          ),
                          StreakIcon(enabled: true),
                          StreakIcon(enabled: true),
                          StreakIcon(),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          "Season",
                          style: detailStyle
                      ),
                      Row(
                        children: <Widget>[
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.arrow_left_rounded,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "\$${playerState.selectedPlayer!.price}",
                            style: detailStyle.merge(TextStyle(color: POColors.accentColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          "Gameweek",
                          style: detailStyle
                      ),
                      Row(
                        children: <Widget>[
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.arrow_left_rounded,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "\$${playerState.selectedPlayer!.price}",
                            style: detailStyle.merge(TextStyle(color: POColors.accentColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          "Sentiment",
                          style: detailStyle
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 4),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 3,
                                  width: 70,
                                  color: Colors.grey.shade200,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 32),
                                  height: 3,
                                  width: 30,
                                  color: Color(0xff03CA45),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 60),
                                  height: 9,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xff03CA45),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),)  ) ;
  }


  TextStyle get detailStyle =>
      TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300);
}

class StreakIcon extends StatelessWidget {
  final bool enabled;

  const StreakIcon({Key? key, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      height: 10,
      width: 3,
      decoration: BoxDecoration(
        color: enabled ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
