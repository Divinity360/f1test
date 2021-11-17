import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/navigator_helper.dart';
import 'package:flutter_app/models/player_model.dart' as model;
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:provider/provider.dart';

class DriverWidget extends StatelessWidget {
  final model.Player player;
  final Function onClick;

  const DriverWidget({Key? key, required this.player, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayersProvider playersProvider =
        Provider.of<PlayersProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        playersProvider.selectedPlayer = player;
        NavigatorHelper.of(context).navigateNamedTo(screen: Constants.route_wplay_detail);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 9),
            height: 113,
            width: 84,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      clipper: TriangleClipper(),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        child: Container(
                          color: const Color(0xff95A4BC),
                          height: 31,
                          width: 180,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2, top: 2),
                      child: Text(
                        'AAA',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.only(top: 15, left: 3, right: 3, bottom: 4),
                  child: Text(
                    "${player.firstName!} ${player.lastName!}".toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                Container(
                  height: 13,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xffF3F5F7),
                  ),
                  child: Center(
                    child: Text(
                      player.positionAbbreviation!.index == 0 ? 'DR' : 'CR',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff797F86),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE0E4E8)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "\$${player.price}M",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.arrow_left_rounded,
                                  color: Color(0xff03CA45),
                                ),
                              ),
                              Text(
                                "\$${player.price}M",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff03CA45),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                )
              ],
            ),
          ),
          player.position!.index == 1
              ? Container(
                  margin: const EdgeInsets.only(top: 23, right: 7),
                  height: 30,
                  width: 76,
                  decoration: BoxDecoration(
                    color: Color(0xffD1D6DE),
                  ),
                  child: Image.network(
                    player.headshot!.profile!,
                    height: 30,
                    width: 76,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 7, bottom: 14),
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                    color: Color(0xffD1D6DE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff242C35).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, -2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    player.headshot!.profile!,
                    height: 50,
                    width: 50,
                  ),
                ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
