import 'package:flutter/material.dart';
import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:kingscorer/styles/styles.dart' as st;

class KozHandRow extends StatefulWidget {
  final Hand kozHand;

  KozHandRow({@required this.kozHand});

  @override
  KozHandRowState createState() {
    return new KozHandRowState();
  }
}

class KozHandRowState extends State<KozHandRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0, left: 8.0),
      child: Row(
        children: <Widget>[
          kozNameSection(),
          kozPuanSection(),
        ],
      ),
    );
  }

  Widget kozNameSection() {
    return Container(
      child: Text(
        getKozTypeName(widget.kozHand),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      width: 120.0,
      padding: EdgeInsets.only(left: 8.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        color: Colors.amber.shade300,
      ),
    );
  }

  Widget kozPuanSection() {
    return Expanded(
      child: new Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            kozGamerSection(
                widget.kozHand.gamer1Result, widget.kozHand.gamer1.username),
            kozGamerSection(
                widget.kozHand.gamer2Result, widget.kozHand.gamer2.username),
            kozGamerSection(
                widget.kozHand.gamer3Result, widget.kozHand.gamer3.username),
            kozGamerSection(
                widget.kozHand.gamer4Result, widget.kozHand.gamer4.username),
          ],
        ),
        decoration: BoxDecoration(
            border: new Border(
                bottom: new BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                    style: BorderStyle.solid))),
      ),
    );
  }

  Widget kozGamerSection(int gamerResult, String username) {
    return Container(
      width: (MediaQuery.of(context).size.width - 136) / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            (gamerResult * 50).toString(),
            style: TextStyle(
              color: widget.kozHand.turnGamer.username == username
                  ? Colors.red
                  : Colors.black,
              fontSize: st.rowPointSize,
            ),
          ),
          Container(
            width: 30,
            child: Text(
              '  ' + gamerResult.toString() + '  ',
              style: TextStyle(
                color: widget.kozHand.turnGamer.username == username
                    ? Colors.red
                    : Colors.black,
                fontSize: st.rowPointSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
