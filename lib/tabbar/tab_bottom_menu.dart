import 'package:kingscorer/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:kingscorer/g_feature/game_feature.dart';

class TabBottomMenu extends StatefulWidget {
  @override
  _TabBottomMenuState createState() => _TabBottomMenuState();
}

class _TabBottomMenuState extends State<TabBottomMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: <Widget>[
              new CustomDataTable(),
              new GameFeature(),
              new Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'KİŞİSEL',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'AYARLAR',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          bottomNavigationBar: new TabBar(
            tabs: <Widget>[
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.rss_feed),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(
                icon: new Icon(Icons.settings),
              )
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
