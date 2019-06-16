import 'package:flutter/material.dart';
import 'package:kingscorer/ui/home/game_list_ui.dart';
import 'package:kingscorer/ui/home/gradient_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new GradientAppBar("Scorer"),
        new GameListUI(),
      ],
    );
  }
}
