import 'package:kingscorer/utils/enums.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectNextModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  SelectNextModal({this.onUpdateCezaKoz});

  final ValueChanged<int> onUpdateCezaKoz;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.highlight_off,
                  color: Colors.white,
                  size: 28,
                ),
              )),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Text('CEZALAR' + ' (' + getNextGamerHands().username + ')',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cezaButtons(
                  context,
                  'RIFKI',
                  1,
                  getSelectableGames(HandType.ceza, CezaType.rifki, null),
                  canSelectThisGame(HandType.ceza)),
              cezaButtons(
                  context,
                  'SON İKİ',
                  2,
                  getSelectableGames(HandType.ceza, CezaType.sonIki, null),
                  canSelectThisGame(HandType.ceza)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cezaButtons(
                  context,
                  'ERKEK ALMAZ',
                  3,
                  getSelectableGames(HandType.ceza, CezaType.erkekAlmaz, null),
                  canSelectThisGame(HandType.ceza)),
              cezaButtons(
                  context,
                  'KIZ ALMAZ',
                  4,
                  getSelectableGames(HandType.ceza, CezaType.kizAlmaz, null),
                  canSelectThisGame(HandType.ceza)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cezaButtons(
                  context,
                  'EL ALMAZ',
                  5,
                  getSelectableGames(HandType.ceza, CezaType.elAlmaz, null),
                  canSelectThisGame(HandType.ceza)),
              cezaButtons(
                  context,
                  'KUPA ALMAZ',
                  6,
                  getSelectableGames(HandType.ceza, CezaType.kupaAlmaz, null),
                  canSelectThisGame(HandType.ceza)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('KOZLAR' + ' (' + getNextGamerHands().username + ')',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Center(
            child: cezaButtons(
                context,
                'KOZ KUPA',
                7,
                getSelectableGames(HandType.koz, null, KozType.kupa),
                canSelectThisGame(HandType.koz)),
          ),
          Center(
            child: cezaButtons(
                context,
                'KOZ KARO',
                8,
                getSelectableGames(HandType.koz, null, KozType.karo),
                canSelectThisGame(HandType.koz)),
          ),
          Center(
            child: cezaButtons(
                context,
                'KOZ MAÇA',
                9,
                getSelectableGames(HandType.koz, null, KozType.maca),
                canSelectThisGame(HandType.koz)),
          ),
          Center(
            child: cezaButtons(
                context,
                'KOZ SİNEK',
                10,
                getSelectableGames(HandType.koz, null, KozType.sinek),
                canSelectThisGame(HandType.koz)),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  Widget cezaButtons(BuildContext context, String cezaName, int index,
      int countCezaHand, bool canSelect) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
      margin: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.40,
        padding: EdgeInsets.only(left: 8, right: 8),
        textColor: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              cezaName,
              style: countCezaHand == 0
                  ? TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.double)
                  : TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 4,
            ),
            countCezaHand != 0
                ? Icon(countCezaHand == 1 ? Icons.looks_one : Icons.looks_two)
                : Container()
          ],
        ),
        onPressed: () {
          if (countCezaHand > 0) {
            //print('Tapped...');
            if (canSelect) {
              onUpdateCezaKoz(index);
              Navigator.pop(context);
            } else {
              Fluttertoast.showToast(
                  msg: "Bu oyunu seçim hakkı dolmuştur. Başka oyun seçiniz.",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 3,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
      ),
    );
  }
}
