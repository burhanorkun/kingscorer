import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/enums.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:flutter/material.dart';

class FillScore extends StatefulWidget {
  final ValueChanged<int> onSetPoint;
  final VoidCallback clearSelectedHand;
  final Hand selectHand;
  final VoidCallback finishedHand;
  int gamer1Result;
  int gamer2Result;
  int gamer3Result;
  int gamer4Result;

  FillScore(
      {this.onSetPoint,
      this.selectHand,
      this.clearSelectedHand,
      this.finishedHand,
      this.gamer1Result,
      this.gamer2Result,
      this.gamer3Result,
      this.gamer4Result});

  @override
  _FillScoreState createState() => _FillScoreState();
}

class _FillScoreState extends State<FillScore> {
  bool finishedScore;

  @override
  void initState() {
    super.initState();
    //gamer1Result = 0;
    //gamer2Result = 0;
    //gamer3Result = 0;
    //gamer4Result = 0;
    finishedScore = false;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: AlertDialog(
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
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 13) return false;
        } else if (cezaType == CezaType.erkekAlmaz) {
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 8) return false;
        } else if (cezaType == CezaType.kizAlmaz) {
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 4) return false;
        } else if (cezaType == CezaType.kupaAlmaz) {
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 13) return false;
        } else if (cezaType == CezaType.rifki) {
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 1) return false;
        } else if (cezaType == CezaType.sonIki) {
          total = widget.gamer1Result +
              widget.gamer2Result +
              widget.gamer3Result +
              widget.gamer4Result;
          if (total == 2) return false;
        }
      } else {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total == 13) return false;
      }
    } else {
      //azaltmaya calisiyor
      if (gamerIndex == 1) {
        if (widget.gamer1Result == 0) return false;
      } else if (gamerIndex == 2) {
        if (widget.gamer2Result == 0) return false;
      } else if (gamerIndex == 3) {
        if (widget.gamer3Result == 0) return false;
      } else if (gamerIndex == 4) {
        if (widget.gamer4Result == 0) return false;
      }
    }
    return true;
  }

  _setGamerPoint(bool increase, int gamerIndex) {
    if (increase) {
      switch (gamerIndex) {
        case 1:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(1);
            setState(() {
              widget.gamer1Result += 1;
            });
          }
          break;
        case 2:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(2);
            setState(() {
              widget.gamer2Result += 1;
            });
          }
          break;
        case 3:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(3);
            setState(() {
              widget.gamer3Result += 1;
            });
          }
          break;
        case 4:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(4);
            setState(() {
              widget.gamer4Result += 1;
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
            widget.onSetPoint(-1);
            setState(() {
              widget.gamer1Result -= 1;
            });
          }
          break;
        case 2:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(-2);
            setState(() {
              widget.gamer2Result -= 1;
            });
          }
          break;
        case 3:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(-3);
            setState(() {
              widget.gamer3Result -= 1;
            });
          }
          break;
        case 4:
          if (_checkSuitability(increase, gamerIndex)) {
            widget.onSetPoint(-4);
            setState(() {
              widget.gamer4Result -= 1;
            });
          }
          break;
        default:
          print('error in _setGamerPoint at false case');
      }
    }
  }

  _okButton() {
    //print("ok button pressed...");
    HandType handType = widget.selectHand.handType;
    CezaType cezaType = CezaType.elAlmaz;
    int total = 0;
    if (handType == HandType.ceza) {
      cezaType = widget.selectHand.cezaType;
    }

    if (handType == HandType.ceza) {
      if (cezaType == CezaType.elAlmaz) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 13) return false;
      } else if (cezaType == CezaType.erkekAlmaz) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 8) return false;
      } else if (cezaType == CezaType.kizAlmaz) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 4) return false;
      } else if (cezaType == CezaType.kupaAlmaz) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 13) return false;
      } else if (cezaType == CezaType.rifki) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 1) return false;
      } else if (cezaType == CezaType.sonIki) {
        total = widget.gamer1Result +
            widget.gamer2Result +
            widget.gamer3Result +
            widget.gamer4Result;
        if (total < 2) return false;
      }
    } else {
      total = widget.gamer1Result +
          widget.gamer2Result +
          widget.gamer3Result +
          widget.gamer4Result;
      if (total < 13) return false;
    }

    //widget.clearSelectedHand();
    widget.finishedHand();
    Navigator.pop(context);
  }

  Widget getContentData() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
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
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(left: 20.0),
                  width: 95,
                  child: Text(
                    mySubString(widget.selectHand.gamer1.username, 8),
                    style: TextStyle(
                        //color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(false, 1),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(false, 1);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(widget.gamer1Result.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(true, 1),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(true, 1);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(left: 20.0),
                  width: 95,
                  child: Text(
                    mySubString(widget.selectHand.gamer2.username, 8),
                    style: TextStyle(
                        //color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(false, 2),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(false, 2);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(widget.gamer2Result.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(true, 2),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(true, 2);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(left: 5.0),
                  width: 95,
                  child: Text(
                    mySubString(widget.selectHand.gamer3.username, 8),
                    style: TextStyle(
                        //color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(false, 3),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(false, 3);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(widget.gamer3Result.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(true, 3),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(true, 3);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(left: 5.0),
                  width: 95,
                  child: Text(
                    mySubString(widget.selectHand.gamer4.username, 8),
                    style: TextStyle(
                        //color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(false, 4),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(false, 4);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(widget.gamer4Result.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                InkWell(
                  onTap: () => _setGamerPoint(true, 4),
                  onLongPress: () {
                    for (var i = 0; i < 13; i++) {
                      _setGamerPoint(true, 4);
                    }
                  },
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(350.0),
                    ),
                    child: new Center(
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
}
