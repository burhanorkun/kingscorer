import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:kingscorer/utils/enums.dart';
import 'package:kingscorer/utils/util.dart';

import '../Routes.dart';

class GameFeature extends StatefulWidget {
  @override
  _GameFeatureState createState() => _GameFeatureState();
}

class _GameFeatureState extends State<GameFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'OYUN SEÇENEKLERİ',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () => _deleteLastGame(),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[600],
                            Colors.blue[500],
                            Colors.blue,
                            Colors.blue[400],
                            Colors.blue[300]
                          ])),
                  child: new Center(
                      child: Text(
                    'Geri Al',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () => _resetCurrentGame(),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[600],
                            Colors.blue[500],
                            Colors.blue,
                            Colors.blue[400],
                            Colors.blue[300]
                          ])),
                  child: new Center(
                      child: Text(
                        'Oyunu Tekrar Oyna',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () => _startNewGame(),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[600],
                            Colors.blue[500],
                            Colors.blue,
                            Colors.blue[400],
                            Colors.blue[300]
                          ])),
                  child: new Center(
                      child: Text(
                        'Yeni Oyun',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _deleteLastGame() async {
    if (getHandLength() > 1) {
      final ConfirmAction action = await _asyncConfirmDialog(context);
      if (action == ConfirmAction.ACCEPT) {
        deleteLastGame();
      }
    }
  }

  _resetCurrentGame() async{
    if (getHandLength() > 1) {
      final ConfirmAction action = await _asyncConfirmDialog2(context);
      if (action == ConfirmAction.ACCEPT) {
        resetCurrentGame();
      }
    }
  }

  _startNewGame() async{
    if (getHandLength() > 0) {
      final ConfirmAction action = await _asyncConfirmDialog3(context);
      if (action == ConfirmAction.ACCEPT) {
        startNewGame();
        Routes.navigateTo(context, '/newusers',
            transition: TransitionType.fadeIn);
      }
    }
  }

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: const Text(
              'Son el silinecektir.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('İPTAL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('KABUL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }

  Future<ConfirmAction> _asyncConfirmDialog2(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: const Text(
              'Aynı oyuncular ile oyun tekrar başlayacaktır. Tüm eller geri gelmeyecek şekilde silinecektir.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('İPTAL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('KABUL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }

  Future<ConfirmAction> _asyncConfirmDialog3(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emin misiniz?'),
          content: const Text(
              'Oyuncular ve tüm eller geri gelmeyecek şekilde silinecektir. Oyuncuların tekrar girilmesi gerekecek.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('İPTAL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('KABUL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }
}
