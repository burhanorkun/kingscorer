import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/enums.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:flutter/material.dart';

class FillScore extends StatefulWidget {
  final Hand selectHand;
  final VoidCallback clearSelectedHand;
  final ValueChanged<Map<String, int>> finishedHand;

  FillScore({
    this.selectHand,
    this.clearSelectedHand,
    this.finishedHand,
  });

  @override
  _FillScoreState createState() => _FillScoreState();
}

class _FillScoreState extends State<FillScore> {
  bool finishedScore;

  int gamer1Result;
  int gamer2Result;
  int gamer3Result;
  int gamer4Result;

  @override
  void initState() {
    super.initState();
    gamer1Result = 0;
    gamer2Result = 0;
    gamer3Result = 0;
    gamer4Result = 0;
    finishedScore = false;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 24.0),
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: getContentData(),
        actions: <Widget>[
          InkWell(
            onTap: () {
              widget.clearSelectedHand();
              Navigator.pop(context);
            },
            child: new Container(
              width: 80,
              height: 40.0,
              decoration: new BoxDecoration(
                  color: Colors.blueAccent,
                  //border: new Border.all(color: Colors.white, width: 2.0),
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
                'İptal',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }

  bool _checkSuitability(bool increase, int gamerIndex) {
    HandType handType = widget.selectHand.handType;
    CezaType cezaType = CezaType.elAlmaz;
    int total = 0;
    if (handType == HandType.ceza) {
      cezaType = widget.selectHand.cezaType;
    }

    if (increase) {
      //arttirmaya calisiyor
      if (handType == HandType.ceza) {
        if (cezaType == CezaType.elAlmaz) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 13) return false;
        } else if (cezaType == CezaType.erkekAlmaz) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 8) return false;
        } else if (cezaType == CezaType.kizAlmaz) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 4) return false;
        } else if (cezaType == CezaType.kupaAlmaz) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 13) return false;
        } else if (cezaType == CezaType.rifki) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 1) return false;
        } else if (cezaType == CezaType.sonIki) {
          total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
          if (total == 2) return false;
        }
      } else {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total == 13) return false;
      }
    } else {
      //azaltmaya calisiyor
      if (gamerIndex == 1) {
        if (gamer1Result == 0) return false;
      } else if (gamerIndex == 2) {
        if (gamer2Result == 0) return false;
      } else if (gamerIndex == 3) {
        if (gamer3Result == 0) return false;
      } else if (gamerIndex == 4) {
        if (gamer4Result == 0) return false;
      }
    }
    return true;
  }

  _setGamerPoint(bool increase, int gamerIndex) {
    if (increase) {
      switch (gamerIndex) {
        case 1:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer1Result += 1;
            });
          }
          break;
        case 2:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer2Result += 1;
            });
          }
          break;
        case 3:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer3Result += 1;
            });
          }
          break;
        case 4:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer4Result += 1;
            });
          }
          break;
        default:
          print('error in _setGamerPoint at true case');
      }
    } else {
      switch (gamerIndex) {
        case 1:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer1Result -= 1;
            });
          }
          break;
        case 2:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer2Result -= 1;
            });
          }
          break;
        case 3:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer3Result -= 1;
            });
          }
          break;
        case 4:
          if (_checkSuitability(increase, gamerIndex)) {
            setState(() {
              gamer4Result -= 1;
            });
          }
          break;
        default:
          print('error in _setGamerPoint at false case');
      }
    }
  }

  _okButton() {
    HandType handType = widget.selectHand.handType;
    CezaType cezaType = CezaType.elAlmaz;
    int total = 0;
    if (handType == HandType.ceza) {
      cezaType = widget.selectHand.cezaType;
    }

    if (handType == HandType.ceza) {
      if (cezaType == CezaType.elAlmaz) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 13) return false;
      } else if (cezaType == CezaType.erkekAlmaz) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 8) return false;
      } else if (cezaType == CezaType.kizAlmaz) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 4) return false;
      } else if (cezaType == CezaType.kupaAlmaz) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 13) return false;
      } else if (cezaType == CezaType.rifki) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 1) return false;
      } else if (cezaType == CezaType.sonIki) {
        total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
        if (total < 2) return false;
      }
    } else {
      total = gamer1Result + gamer2Result + gamer3Result + gamer4Result;
      if (total < 13) return false;
    }

    Map<String, int> returnMap = {
      'gamer1': gamer1Result,
      'gamer2': gamer2Result,
      'gamer3': gamer3Result,
      'gamer4': gamer4Result
    };

    widget.finishedHand(returnMap);
    Navigator.pop(context);
  }

  Widget getContentData() {
    return Container(
      //height: MediaQuery.of(context).size.height / 2.2,
      height: MediaQuery.of(context).size.height * 0.47,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                  '${widget.selectHand.handType == HandType.ceza ? getCezaTypeName2(widget.selectHand) : getKozTypeName2(widget.selectHand)} Sonuç',
                  style: TextStyle(
                      //color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _customGamerName(widget.selectHand.gamer1.username),
                _customButton(false, 1, Icons.remove),
                _customGamerResult(gamer1Result.toString()),
                _customButton(true, 1, Icons.add),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _customGamerName(widget.selectHand.gamer2.username),
                _customButton(false, 2, Icons.remove),
                _customGamerResult(gamer2Result.toString()),
                _customButton(true, 2, Icons.add),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _customGamerName(widget.selectHand.gamer3.username),
                _customButton(false, 3, Icons.remove),
                _customGamerResult(gamer3Result.toString()),
                _customButton(true, 3, Icons.add),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _customGamerName(widget.selectHand.gamer4.username),
                _customButton(false, 4, Icons.remove),
                _customGamerResult(gamer4Result.toString()),
                _customButton(true, 4, Icons.add),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () => _okButton(),
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.4,
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
                    'OK',
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

  Widget _customGamerName(String gamerUsername) {
    return Container(
      width: 95,
      child: Text(
        mySubString(gamerUsername, 8),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _customButton(bool gamePointBool, int setGameInt, IconData icon) {
    return InkWell(
      onTap: () => _setGamerPoint(gamePointBool, setGameInt),
      onLongPress: () {
        for (var i = 0; i < 13; i++) {
          _setGamerPoint(gamePointBool, setGameInt);
        }
      },
      child: new Container(
        width: 40.0,
        height: 40.0,
        decoration: new BoxDecoration(
          color: gamePointBool ? Colors.blueAccent : Colors.red,
          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(350.0),
        ),
        child: new Center(
          child: new Icon(
            icon,
            color: Colors.black,
            size: 25.0,
          ),
        ),
      ),
    );
  }

  Widget _customGamerResult(String gamerResult) {
    return Container(
      width: 50.0,
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Text(gamerResult,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
