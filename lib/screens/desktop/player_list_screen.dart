

import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/team_helper.dart';
import 'package:flutter_app/models/player_model.dart' as playerModel;
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/players_provider.dart';
import 'package:flutter_app/themes/colors.dart';
import 'package:flutter_app/themes/dimens.dart';
import 'package:flutter_app/widgets/player_detail_desktop_item.dart';
import 'package:flutter_app/widgets/player_detail_item.dart';
import 'package:provider/provider.dart';

class NPlayerListScreen extends StatefulWidget {
  const NPlayerListScreen({Key? key}) : super(key: key);

  @override
  _NPlayerListScreenState createState() => _NPlayerListScreenState();
}

class _NPlayerListScreenState extends State<NPlayerListScreen> {
  final _listController = ScrollController();
  var _searchController = TextEditingController();
  PlayersProvider? playersProvider;
  String _search = '';
  var _isSearch = false;

  @override
  void initState() {
    super.initState();
    playersProvider = Provider.of<PlayersProvider>(context, listen: false);
    playersProvider!.filterUser('');
    _searchController.addListener(() {
      _search = _searchController.text;
      playersProvider!.filterUser(_search);
    });
  }

  @override
  void dispose() {
    _listController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayersProvider>(
        builder: (context, playerState, child) => Scaffold(
          body: Center(child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ), child:  Column(
            children: [
              Row(children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearch = true;
                    });
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.star_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () => TeamHelper.showBottomFilterMenu(
                      context, _search, playerState),
                ),
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {},
                ),
              ],),
              if (_isSearch)
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: POColors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: TextField(
                      controller: _searchController,
                      cursorColor: POColors.green,
                      decoration: InputDecoration(
                        focusColor: POColors.green,
                        hoverColor: POColors.green,
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: POColors.green,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: POColors.green,
                          ),
                          onPressed: () {
                            _search = '';
                            _isSearch = false;
                            _searchController.text = '';
                            // _filterUser('');
                          },
                        ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              Container(
                height: 0.5,
                color: POColors.dividerColor,
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.separated(
                      controller: _listController,
                      itemBuilder: (context, i) =>
                          PlayerDetailDesktopItem(player: playerState.visiblePlayersList.elementAt(i)),
                      separatorBuilder: (context, i) => Divider(),
                      itemCount: playerState.visiblePlayersList.length,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        margin: EdgeInsets.only(bottom: 10.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            color: POColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${playerState.visiblePlayersList.length} RESULTS SORTED BY ${playerState.getSortedName()}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                                  width: 1,
                                  height: 36,
                                  color: POColors.lightGray,
                                ),
                                Icon(
                                  Icons.sort,
                                  size: 18.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: POColors.dividerColor,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Hide list',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      'TO PICK:',
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '1/6',
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      width: 1.0,
                      height: 16.0,
                      color: POColors.dividerColor,
                    ),
                    Text(
                      'AVERAGE:',
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '\$0.0M',
                      style: TextStyle(
                          fontSize: 10.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),),) ,
          floatingActionButton: Card(
            margin: EdgeInsets.only(bottom: 50),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: InkWell(
              onTap: () => _listController.animateTo(
                _listController.position.minScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              ),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: POColors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_upward,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ));
  }



}

