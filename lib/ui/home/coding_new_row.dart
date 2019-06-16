import 'package:flutter/material.dart';
import 'package:kingscorer/styles/Theme.dart' as th;

class CodingNewRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameCard = new Container(
      margin: const EdgeInsets.only(left: 14.0, right: 14.0),
      decoration: new BoxDecoration(
        color: th.Colors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(14.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
          margin: const EdgeInsets.only(top: 2.0, left: 2.0),
          constraints: new BoxConstraints.expand(),
          child: new Center(
            child: new Text('? ? ?', style: th.TextStyles.planetTitle),
          )),
    );

    return Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        child: new Stack(
          children: <Widget>[gameCard],
        ),
        onPressed: () => {},
      ),
    );
  }
}
