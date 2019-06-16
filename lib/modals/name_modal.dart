import 'package:flutter/material.dart';
//import 'package:flutter_king_score/models/models.dart';
//import 'package:flutter_king_score/utils/util.dart';

class NameModal extends StatefulWidget {
  final ValueChanged<String> onSetGamer1;
  final ValueChanged<String> onSetGamer2;
  final ValueChanged<String> onSetGamer3;
  final ValueChanged<String> onSetGamer4;

  NameModal(
      {this.onSetGamer1, this.onSetGamer2, this.onSetGamer3, this.onSetGamer4});

  @override
  _NameModalState createState() => _NameModalState();
}

class _NameModalState extends State<NameModal> {
  String gamer1Name;
  String gamer2Name;
  String gamer3Name;
  String gamer4Name;

  @override
  void initState() {
    super.initState();
    gamer1Name = '';
    gamer1Name = '';
    gamer1Name = '';
    gamer1Name = '';
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
              Navigator.pop(context);
            },
            child: new Container(
              width: 80,
              height: 40.0,
              decoration: new BoxDecoration(
                  color: Colors.blueAccent,
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

  Widget getContentData() {
    return Container(
      //height: MediaQuery.of(context).size.height / 2.2,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text('Yeni Oyunda Oyuncuları Seç',
                  style: TextStyle(
                      //color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
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

  _okButton() {
    if (gamer1Name.isEmpty ||
        gamer2Name.isEmpty ||
        gamer3Name.isEmpty ||
        gamer4Name.isEmpty) {
      return;
    }
    widget.onSetGamer1(gamer1Name);
    widget.onSetGamer2(gamer2Name);
    widget.onSetGamer3(gamer3Name);
    widget.onSetGamer4(gamer4Name);
    Navigator.pop(context);
  }
}
