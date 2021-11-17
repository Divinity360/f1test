import 'package:flutter/material.dart';
import 'package:flutter_app/models/player_model.dart' as playerModel;

class PlayerDetailHeader extends StatelessWidget {
  final playerModel.Player player;

  const PlayerDetailHeader({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
              color: Colors.white,
            ),
            Padding(padding: EdgeInsets.only(left: 80), child: SizedBox(
              width: 100,
              height: 50,
              child: Image.asset(
                'assets/logo.png',
                height: 240,
              ),
            ),)
            ,
          ],
        ),
        Stack(
          children: [
            Image.network(
              player.profileImage!.url!,
              height: 130,
              width: 107,
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 15),child: Text(
          player.firstName!,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),)
        ,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            player.lastName!,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 11,
          margin: EdgeInsets.only(top: 2),
          width: player.position!.index == 0 ? 41: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Center(
            child: Text(
              player.position!.index == 0 ? 'DRIVER' : 'CONSTRUCTOR',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 5),
          child: Text(
            "\$${player.price}M",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.star_border_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Text(
                "Add Favourite",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
