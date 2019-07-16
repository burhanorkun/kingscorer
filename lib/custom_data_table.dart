import 'package:flutter/material.dart';
import 'package:kingscorer/modals/fill_score.dart';
import 'package:kingscorer/modals/select_next_modal.dart';
import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/enums.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:kingscorer/styles/styles.dart' as st;

class CustomDataTable extends StatefulWidget {
  @override
  _CustomDataTableState createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  bool finished;
  Hand selectedHand;

  String gamer1Name = '';
  String gamer2Name = '';
  String gamer3Name = '';
  String gamer4Name = '';

  @override
  void initState() {
    finished = false;
    resetGamersScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          setUserNames(),
          cezaCountsInfo(),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: st.customDataTableListviewTop),
            children: getCezaHandsWidgets(),
          ),
          cezaTotalInfo(),
          Divider(),
          kozCountsInfo(),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: st.customDataTableListviewTop),
            children: getKozHandsWidgets(),
          ),
          kozTotalInfo(),
          Divider(),
          generalTotalInfo(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                !finished && selectedHand != null
                    ? selectedHand.handType == HandType.ceza
                        ? Text(
                            (selectedHand.turnCount - 1).toString() +
                                '.el: ' +
                                mySubString(
                                    selectedHand.turnGamer.username, 15) +
                                ' -> ' +
                                getCezaTypeName2(selectedHand),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                              fontSize: 18.0,
                            ))
                        : Text(
                            (selectedHand.turnCount - 1).toString() +
                                '.el: ' +
                                mySubString(
                                    selectedHand.turnGamer.username, 15) +
                                ' -> ' +
                                getKozTypeName2(selectedHand),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                              fontSize: 18.0,
                            ))
                    : Container(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: (finished || getMaxHandCount() == 20)
          ? Container()
          : Opacity(
              opacity: getMaxHandCount() > 16 ? 0.5 : 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 40.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (selectedHand == null) {
                          Navigator.of(context).push(SelectNextModal(
                              onUpdateCezaKoz: _updateNewHandGame));
                          setState(() {
                            finished = getMaxHandCount() < 20 ? false : true;
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return FillScore(
                                  selectHand: selectedHand,
                                  clearSelectedHand: clearSelectedHand,
                                  finishedHand: _finishedHand,
                                );
                              });
                        }
                      },
                      tooltip: 'Add Point',
                      child:
                          Icon(selectedHand == null ? Icons.add : Icons.create),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget setUserNames() {
    return new Container(
      padding: EdgeInsets.only(top: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          handsStatusSection(),
          gamersNameSection(),
        ],
      ),
    );
  }

  Widget handsStatusSection() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        getMaxHandCount().toString() + '/20',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      width: 120.0,
      padding: EdgeInsets.only(left: 8.0),
    );
  }

  Widget gamersNameSection() {
    return Expanded(
      child: new Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(mySubString(hands[0].gamer1.username, 8),
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(mySubString(hands[0].gamer2.username, 8),
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(mySubString(hands[0].gamer3.username, 8),
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(mySubString(hands[0].gamer4.username, 8),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget cezaCountsInfo() {
    return new Container(
      padding: EdgeInsets.only(top: 4.0, left: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              'Cezalar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            width: 120.0,
            padding: EdgeInsets.only(left: 8.0),
          ),
          cezaInfoIcons(),
        ],
      ),
    );
  }

  Widget kozCountsInfo() {
    return new Container(
      padding: EdgeInsets.only(top: 2.0, left: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              'Kozlar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            width: 120.0,
            padding: EdgeInsets.only(left: 8.0),
          ),
          kozInfoIcons(),
        ],
      ),
    );
  }

  Widget cezaInfoIcons() {
    return Expanded(
      child: new Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                new Icon(
                  getCezaCount(1) > 0 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(1) > 1 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(1) > 2 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getCezaCount(2) > 0 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(2) > 1 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(2) > 2 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getCezaCount(3) > 0 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(3) > 1 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(3) > 2 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getCezaCount(4) > 0 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(4) > 1 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getCezaCount(4) > 2 ? Icons.star : Icons.star_border,
                  size: 18.0,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget kozInfoIcons() {
    return Expanded(
      child: new Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                new Icon(
                  getKozCount(1) > 0 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getKozCount(1) > 1 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getKozCount(2) > 0 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getKozCount(2) > 1 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getKozCount(3) > 0 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getKozCount(3) > 1 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Icon(
                  getKozCount(4) > 0 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
                new Icon(
                  getKozCount(4) > 1 ? Icons.lens : Icons.panorama_fish_eye,
                  size: 18.0,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cezaTotalInfo() {
    return new Container(
      padding: EdgeInsets.only(top: 10.0, left: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              'Ceza Toplam:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: st.rowTotalNameSize),
            ),
            width: 120.0,
            padding: EdgeInsets.only(left: 8.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(getUserCezaTotal(1).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserCezaTotal(2).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserCezaTotal(3).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserCezaTotal(4).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget kozTotalInfo() {
    return new Container(
      padding: EdgeInsets.only(top: 10.0, left: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              'Koz Toplam:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: st.rowTotalNameSize),
            ),
            width: 120.0,
            padding: EdgeInsets.only(left: 8.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(getUserKozTotal(1),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserKozTotal(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserKozTotal(3),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                  Text(getUserKozTotal(4),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: st.rowTotalPointSize)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget generalTotalInfo() {
    return new Container(
      padding: EdgeInsets.only(top: 2.0, left: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              'TOPLAM:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            width: 120.0,
            padding: EdgeInsets.only(left: 8.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(getGeneralTotal(1).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getGeneralTotal(1) >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: st.rowTotalPointSize)),
                      Icon(
                        getGeneralTotal(1) >= 0
                            ? Icons.file_upload
                            : Icons.file_download,
                        color:
                            getGeneralTotal(1) >= 0 ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(getGeneralTotal(2).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getGeneralTotal(2) >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: st.rowTotalPointSize)),
                      Icon(
                        getGeneralTotal(2) >= 0
                            ? Icons.file_upload
                            : Icons.file_download,
                        color:
                            getGeneralTotal(2) >= 0 ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(getGeneralTotal(3).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getGeneralTotal(3) >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: st.rowTotalPointSize)),
                      Icon(
                        getGeneralTotal(3) >= 0
                            ? Icons.file_upload
                            : Icons.file_download,
                        color:
                            getGeneralTotal(3) >= 0 ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(getGeneralTotal(4).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getGeneralTotal(4) >= 0
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: st.rowTotalPointSize)),
                      Icon(
                        getGeneralTotal(4) >= 0
                            ? Icons.file_upload
                            : Icons.file_download,
                        color:
                            getGeneralTotal(4) >= 0 ? Colors.green : Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateNewHandGame(int index) {
    setState(() {
      if (getMaxHandCount() == 1) {}

      selectedHand = updateNewHandWidget(index);
      finished = getMaxHandCount() < 20 ? false : true;
    });
  }

  void _finishedHand(Map<String, int> result) {
    Hand newHand = new Hand(
      handType: selectedHand.handType,
      cezaType: selectedHand.cezaType,
      kozType: selectedHand.kozType,
      turnCount: selectedHand.turnCount,
      turnGamer: selectedHand.turnGamer,
      gamer1: selectedHand.gamer1,
      gamer1Result: result['gamer1'],
      gamer2: selectedHand.gamer2,
      gamer2Result: result['gamer2'],
      gamer3: selectedHand.gamer3,
      gamer3Result: result['gamer3'],
      gamer4: selectedHand.gamer4,
      gamer4Result: result['gamer4'],
    );
    pushNewHand(newHand);
    resetGamersScore();
    setState(() {
      finished = getMaxHandCount() < 20 ? false : true;
    });
  }

  void resetGamersScore() {
    selectedHand = null;
  }

  void clearSelectedHand() {
    setState(() {
      selectedHand = null;
    });
  }
}
