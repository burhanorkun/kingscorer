import 'package:flutter/material.dart';
import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:kingscorer/styles/styles.dart' as st;

class CezaHandRow extends StatefulWidget {
  final Hand cezaHand;

  CezaHandRow({@required this.cezaHand});

  @override
  CezaHandRowState createState() {
    return new CezaHandRowState();
  }
}

class CezaHandRowState extends State<CezaHandRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0, left: 8.0),
      child: Row(
        children: <Widget>[
          cezaNameSection(),
          cezaPuanSection(),
        ],
      ),
    );
  }

  Widget cezaNameSection() {
    return Container(
      child: Text(
        getCezaTypeName(widget.cezaHand),
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

  Widget cezaPuanSection() {
    return Expanded(
      child: new Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            cezaGamerSection(
                widget.cezaHand.gamer1Result, widget.cezaHand.gamer1.username),
            cezaGamerSection(
                widget.cezaHand.gamer2Result, widget.cezaHand.gamer2.username),
            cezaGamerSection(
                widget.cezaHand.gamer3Result, widget.cezaHand.gamer3.username),
            cezaGamerSection(
                widget.cezaHand.gamer4Result, widget.cezaHand.gamer4.username),
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

  Widget cezaGamerSection(int gamerResult, String username) {
    return Container(
      width: (MediaQuery.of(context).size.width - 136) / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            getCezaPointInt(widget.cezaHand.cezaType, gamerResult).toString(),
            style: TextStyle(
              color: widget.cezaHand.turnGamer.username == username
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
                color: widget.cezaHand.turnGamer.username == username
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
