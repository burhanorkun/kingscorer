import 'package:flutter/material.dart';
//import 'package:flutter_king_score/styles/Theme.dart' as th;
//import 'package:flutter_king_score/ui/home/coding_new_row.dart';
import 'package:kingscorer/ui/home/game_king_row.dart';

class GameListUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        //color: th.Colors.planetPageBackground,
        child: new ListView(
          itemExtent: 100.0,
          children: <Widget>[
            new GameKingRow(),
            //new CodingNewRow(),
          ],
        ),
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/king_game2.jpg'),
    );
  }
}
