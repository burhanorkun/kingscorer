import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:kingscorer/Routes.dart';
import 'package:kingscorer/ui/home/gradient_app_bar.dart';
import 'package:kingscorer/utils/util.dart';
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class NewUsersPage extends StatefulWidget {
  @override
  _NewUsersPageState createState() => _NewUsersPageState();
}

class _NewUsersPageState extends State<NewUsersPage> {
  int _radioValue = -1;

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();

  String optionCaption1;
  String optionCaption2;
  String optionCaption3;
  String optionCaption4;

  static Map<String, String> _formData = {
    'gamer1': null,
    'gamer2': null,
    'gamer3': null,
    'gamer4': null,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  _changeOptionValue1() {
    setState(() {
      optionCaption1 = mySubString(myController1.text, 10);
    });
  }

  _changeOptionValue2() {
    setState(() {
      optionCaption2 = mySubString(myController2.text, 10);
    });
  }

  _changeOptionValue3() {
    setState(() {
      optionCaption3 = mySubString(myController3.text, 10);
    });
  }

  _changeOptionValue4() {
    setState(() {
      optionCaption4 = mySubString(myController4.text, 10);
    });
  }

  @override
  void initState() {
    super.initState();
    myController1.addListener(_changeOptionValue1);
    myController2.addListener(_changeOptionValue2);
    myController3.addListener(_changeOptionValue3);
    myController4.addListener(_changeOptionValue4);
    optionCaption1 = '1. Oyuncu';
    optionCaption2 = '2. Oyuncu';
    optionCaption3 = '3. Oyuncu';
    optionCaption4 = '4. Oyuncu';
  }

  @override
  void dispose() {
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    return new Scaffold(
        body: SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new GradientAppBar("Oyuncular"), //Select Names
          _setGamerNames(targetWidth),
        ],
      ),
    ));
  }

  Widget _setGamerNames(double targetWidth) {
    return new Container(
      /*decoration: BoxDecoration(
          image: _buildBackgroundImage(),),*/
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Oyuncu 1', //Gamer 1
                        filled: true,
                        fillColor: Colors.white,
                        counterText: ''),
                    validator: (value) => value.isEmpty ? 'Lütfen boş bırakmayınız':null,
                    onSaved: (String value) {
                      _formData['gamer1'] = capitalize(value.trim());
                    },
                    controller: myController1,
                    maxLength: 30,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Oyuncu 2', //Gamer 2
                        filled: true,
                        fillColor: Colors.white,
                        counterText: ''),
                    validator: (value) => value.isEmpty ? 'Lütfen boş bırakmayınız':null,
                    onSaved: (String value) {
                      _formData['gamer2'] = capitalize(value.trim());
                    },
                    controller: myController2,
                    maxLength: 30,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Oyuncu 3', //Gamer 3
                        filled: true,
                        fillColor: Colors.white,
                        counterText: ''),
                    validator: (value) => value.isEmpty ? 'Lütfen boş bırakmayınız':null,
                    onSaved: (String value) {
                      _formData['gamer3'] = capitalize(value.trim());
                    },
                    controller: myController3,
                    maxLength: 30,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Oyuncu 4', //Gamer 4
                        filled: true,
                        fillColor: Colors.white,
                        counterText: ''),
                    validator: (value) => value.isEmpty ? 'Lütfen boş bırakmayınız':null,
                    onSaved: (String value) {
                      _formData['gamer4'] = capitalize(value.trim());
                    },
                    controller: myController4,
                    maxLength: 30,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Text('Oyuna kim önce başlayacak?'),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          new Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            optionCaption1,
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            optionCaption2,
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            optionCaption3,
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Radio(
                            value: 3,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            optionCaption4,
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  new RaisedButton(
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text('OK'),
                      onPressed: // _submitForm(),
                          () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        if (_radioValue < 0) {
                          Toast.show("Oyuna kim başlayacak? Lütfen oyuna başlayacak oyuncuyu seçiniz.",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.CENTER,
                              backgroundColor: Colors.red);
                          /*
                          Fluttertoast.showToast(
                              msg:
                                  "Oyuna kim başlayacak? Lütfen oyuna başlayacak oyuncuyu seçiniz.",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0); */
                          return;
                        }
                        if (!areDiffUserNames(_formData)) {
                          Toast.show("Oyuncu isimleri aynı olamaz. Lütfen farklı isim giriniz.",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.CENTER,
                              backgroundColor: Colors.red);
                          /*
                          Fluttertoast.showToast(
                              msg:
                                  "Oyuncu isimleri aynı olamaz. Lütfen farklı isim giriniz.",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0); */
                          return;
                        }

                        if (isHandEmpty()) {
                          pushInitialGamerName(_formData, _radioValue);
                        }
                        Routes.navigateTo(context, '/gametable',
                            transition: TransitionType.fadeIn);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum MyDialogAction { gamer1, gamer2, gamer3, gamer4 }
