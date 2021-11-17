import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/navigator_helper.dart';
import 'package:flutter_app/models/player_model.dart' as playerModel;
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:provider/provider.dart';

class PlayerDetailItem extends StatelessWidget {
  final playerModel.Player player;

  const PlayerDetailItem({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child: Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xffF3F5F7),
                  backgroundImage: NetworkImage(
                      player
                          .headshot!
                          .profile!),
                ),
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  playerDetailWidget(player, context),
                  SizedBox(height: 6,),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: Text("Q", style: detailStyle),
                      ),
                      StreakIcon2(enabled: true),
                      StreakIcon2(),
                      StreakIcon2(),
                      StreakIcon2(),
                      StreakIcon2(),
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 3),
                        child: Text("R", style: detailStyle),
                      ),
                      StreakIcon2(enabled: true),
                      StreakIcon2(enabled: true),
                      StreakIcon2(),
                      StreakIcon2(),
                      StreakIcon2(),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Text("${player.currentPriceChangeInfo!.currentSelectionPercentage}.0%", style: detailStyle),
                      ),
                      Text("${player.constructorData?.championshipPoints ?? player.driverData!.championshipPoints}", style: detailStyle),

                      Text("pts", style: detailStyle.merge(TextStyle(fontSize: 6))),

                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xffE6E9EC),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "\$${player.price}M",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      Row(
                        children: <Widget>[
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.arrow_left_rounded,
                              color: Color(0xff03CA45),
                              size: 10,
                            ),
                          ),
                          Text(
                            "\$${player.price}M",
                            style: TextStyle(
                                color: Color(0xff03CA45),
                                fontWeight: FontWeight.bold,
                                fontSize: 11
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 3,
                              width: 30,
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
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffAFBFC9),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Color(0xff03CA45),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    ]), onTap: (){
      Provider.of<PlayersProvider>(context, listen: false).selectedPlayer = player;
      NavigatorHelper.of(context).navigateNamedTo(screen: Constants.route_wplay_detail);
    },) ;


  }
  Row playerDetailWidget(playerModel.Player player, BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.star_outline_rounded, size: 21,),
        ),
        Text(player.positionAbbreviation == playerModel.PositionAbbreviation.CR
            ? "CR"
            : "DR", style: TextStyle(color: Color(0xff797F86), fontSize: 11, fontWeight: FontWeight.bold),),
        Container(
          margin: const EdgeInsets.all(8),
          height: 14,
          width: 28,
          color: Color(0xffD1D6DE),
          alignment: Alignment.center,
          child:  Text(
            player.teamAbbreviation!,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.18,
          child: Text(
            player.firstName!,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

}
TextStyle get detailStyle =>
    TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w400);


class StreakIcon2 extends StatelessWidget {
  final bool enabled;

  const StreakIcon2({Key? key, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      height: 10,
      width: 3,
      decoration: BoxDecoration(
        color: enabled ? Colors.green : Color(0xffD1D6DE),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
