import 'package:flutter/material.dart';
import 'package:flutter_app/models/custom_team_model.dart';
import 'package:flutter_app/models/player_model.dart' as playerModel;
import 'package:flutter_app/widgets/driver_widget.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/themes/dimens.dart';
import 'package:flutter_app/widgets/popup_item.dart';
import 'package:flutter_app/widgets/team_rename_bottom_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamScreen extends StatefulWidget {
  final CustomTeam team;
  final int index;
  final Function() renameTeam;
  final Function() recreateTeam;
  final Function() replicateTeam;
  final Function() deleteTeam;

  const TeamScreen({
    Key? key,
    required this.team,
    required this.index,
    required this.renameTeam,
    required this.recreateTeam,
    required this.replicateTeam,
    required this.deleteTeam,
  }) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimenCorner),
        ),
        elevation: 5,
        shadowColor: POColors.shadowColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(dimenCorner),
          child: Column(
            children: [
              Container(
                height: dimenHeader,
                child: Row(
                  children: [
                    Container(
                      color: POColors.secondaryColor,
                      width: 40,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'T${widget.index}',
                        style: TextStyle(
                          fontSize: 14,
                          color: POColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: offsetSm,
                    ),
                    Text(
                      widget.team.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: POColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // width: double.infinity,
                  color: POColors.secondaryColor,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(
                              'assets/images/img_back_team.svg'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: widget.team.playerList
                                              .sublist(0, 3)
                                              .map((player) => DriverWidget(
                                                    player: player,
                                                    onClick: () =>
                                                        _detailPlayer(player),
                                                  ))
                                              .toList(),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: widget.team.playerList
                                              .sublist(3, 5)
                                              .map((player) => DriverWidget(
                                                    player: player,
                                                    onClick: () =>
                                                        _detailPlayer(player),
                                                  ))
                                              .toList(),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        DriverWidget(
                                          player: widget.team.playerList.last,
                                          onClick: () => _detailPlayer(
                                              widget.team.playerList.last),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Image.asset(
                                'assets/logo.png',
                                width: 38.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: dimenFooter,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Spacer(),
                    PopupMenuButton(
                      padding: EdgeInsets.zero,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: POColors.lightGray,
                          width: 1.0,
                        ),
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case 1:
                            widget.recreateTeam();
                            break;
                          case 2:
                            widget.replicateTeam();
                            break;
                          case 0:
                            widget.renameTeam();
                            break;
                          case 3:
                            widget.deleteTeam();
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: PopupItem(
                              icon: Icons.edit_outlined,
                              text: 'Rename',
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: PopupItem(
                                icon: Icons.copy_outlined, text: 'Recreate'),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: PopupItem(
                                icon: Icons.copy_outlined, text: 'Replicate'),
                            value: 2,
                          ),
                          PopupMenuItem(
                            enabled: false,
                            height: 4,
                            child: Container(
                              height: 1,
                              color: Color(0xffD1D6DE),
                            ),
                          ),
                          PopupMenuItem(
                            child: PopupItem(
                                icon: Icons.delete_outline, text: 'Delete'),
                            value: 3,
                          ),
                        ];
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: POColors.lightGray,
                          borderRadius: BorderRadius.circular(offsetXSm),
                        ),
                        child: Icon(
                          Icons.more_vert,
                          color: POColors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _detailPlayer(playerModel.Player model) {}
}
