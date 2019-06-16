import 'package:kingscorer/utils/enums.dart';
import 'package:meta/meta.dart';

class Hand {
  HandType handType;
  CezaType cezaType;
  KozType kozType;
  int turnCount;
  Gamer turnGamer;
  Gamer gamer1;
  int gamer1Result;
  Gamer gamer2;
  int gamer2Result;
  Gamer gamer3;
  int gamer3Result;
  Gamer gamer4;
  int gamer4Result;

  Hand(
      {@required this.handType,
      this.cezaType,
      this.kozType,
      @required this.turnCount,
      @required this.turnGamer,
      @required this.gamer1,
      @required this.gamer1Result,
      @required this.gamer2,
      @required this.gamer2Result,
      @required this.gamer3,
      @required this.gamer3Result,
      @required this.gamer4,
      @required this.gamer4Result});

  set setG1Result(int result) {
    this.gamer1Result = result;
  }

  set setG2Result(int result) {
    this.gamer2Result = result;
  }

  set setG3Result(int result) {
    this.gamer3Result = result;
  }

  set setG4Result(int result) {
    this.gamer4Result = result;
  }
}

var hands = <Hand>[
  /*
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.rifki,
      turnCount: 1,
      turnGamer: gamer1,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result:
          0), */
  /*
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.kizAlmaz,
      turnCount: 2,
      turnGamer: gamer2,
      gamer1: gamer1,
      gamer1Result: 0,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 2,
      gamer4: gamer4,
      gamer4Result: 2),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.erkekAlmaz,
      turnCount: 3,
      turnGamer: gamer3,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 4,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result: 3),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.elAlmaz,
      turnCount: 4,
      turnGamer: gamer4,
      gamer1: gamer1,
      gamer1Result: 3,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 5,
      gamer4: gamer4,
      gamer4Result: 5),
  Hand(
      handType: HandType.koz,
      kozType: KozType.kupa,
      turnCount: 5,
      turnGamer: gamer1,
      gamer1: gamer1,
      gamer1Result: 3,
      gamer2: gamer2,
      gamer2Result: 4,
      gamer3: gamer3,
      gamer3Result: 6,
      gamer4: gamer4,
      gamer4Result: 0),
  Hand(
      handType: HandType.koz,
      kozType: KozType.karo,
      turnCount: 6,
      turnGamer: gamer2,
      gamer1: gamer1,
      gamer1Result: 3,
      gamer2: gamer2,
      gamer2Result: 1,
      gamer3: gamer3,
      gamer3Result: 5,
      gamer4: gamer4,
      gamer4Result: 4),
  Hand(
      handType: HandType.koz,
      kozType: KozType.maca,
      turnCount: 7,
      turnGamer: gamer3,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 2,
      gamer3: gamer3,
      gamer3Result: 7,
      gamer4: gamer4,
      gamer4Result: 3),
  Hand(
      handType: HandType.koz,
      kozType: KozType.sinek,
      turnCount: 8,
      turnGamer: gamer4,
      gamer1: gamer1,
      gamer1Result: 5,
      gamer2: gamer2,
      gamer2Result: 1,
      gamer3: gamer3,
      gamer3Result: 3,
      gamer4: gamer4,
      gamer4Result: 4),
  Hand(
      handType: HandType.koz,
      kozType: KozType.kupa,
      turnCount: 9,
      turnGamer: gamer1,
      gamer1: gamer1,
      gamer1Result: 5,
      gamer2: gamer2,
      gamer2Result: 1,
      gamer3: gamer3,
      gamer3Result: 3,
      gamer4: gamer4,
      gamer4Result: 4),
  Hand(
      handType: HandType.koz,
      kozType: KozType.sinek,
      turnCount: 10,
      turnGamer: gamer2,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 5,
      gamer3: gamer3,
      gamer3Result: 3,
      gamer4: gamer4,
      gamer4Result: 4),
  Hand(
      handType: HandType.koz,
      kozType: KozType.karo,
      turnCount: 11,
      turnGamer: gamer3,
      gamer1: gamer1,
      gamer1Result: 5,
      gamer2: gamer2,
      gamer2Result: 1,
      gamer3: gamer3,
      gamer3Result: 3,
      gamer4: gamer4,
      gamer4Result: 4),
  Hand(
      handType: HandType.koz,
      kozType: KozType.maca,
      turnCount: 12,
      turnGamer: gamer4,
      gamer1: gamer1,
      gamer1Result: 3,
      gamer2: gamer2,
      gamer2Result: 3,
      gamer3: gamer3,
      gamer3Result: 5,
      gamer4: gamer4,
      gamer4Result: 2),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.rifki,
      turnCount: 13,
      turnGamer: gamer1,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result: 0),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.kizAlmaz,
      turnCount: 14,
      turnGamer: gamer2,
      gamer1: gamer1,
      gamer1Result: 0,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 2,
      gamer4: gamer4,
      gamer4Result: 2),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.erkekAlmaz,
      turnCount: 15,
      turnGamer: gamer3,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 4,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result: 3),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.elAlmaz,
      turnCount: 16,
      turnGamer: gamer4,
      gamer1: gamer1,
      gamer1Result: 3,
      gamer2: gamer2,
      gamer2Result: 0,
      gamer3: gamer3,
      gamer3Result: 5,
      gamer4: gamer4,
      gamer4Result: 5),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.kupaAlmaz,
      turnCount: 17,
      turnGamer: gamer1,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 10,
      gamer3: gamer3,
      gamer3Result: 2,
      gamer4: gamer4,
      gamer4Result: 0),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.sonIki,
      turnCount: 18,
      turnGamer: gamer2,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 1,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result: 0),
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.kupaAlmaz,
      turnCount: 19,
      turnGamer: gamer3,
      gamer1: gamer1,
      gamer1Result: 1,
      gamer2: gamer2,
      gamer2Result: 8,
      gamer3: gamer3,
      gamer3Result: 1,
      gamer4: gamer4,
      gamer4Result:
          3), */
  /*
  Hand(
      handType: HandType.ceza,
      cezaType: CezaType.sonIki,
      turnCount: 20,
      turnGamer: gamer4,
      gamer1: gamer1,
      gamer1Result: 0,
      gamer2: gamer2,
      gamer2Result: 2,
      gamer3: gamer3,
      gamer3Result: 0,
      gamer4: gamer4,
      gamer4Result: 0),*/
];

var gamer1 = new Gamer(
  username: 'Burhan',
);
var gamer2 = new Gamer(
  username: 'Özcan',
);
var gamer3 = new Gamer(
  username: 'Onur',
);
var gamer4 = new Gamer(
  username: 'Barış',
);

class Gamer {
  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final String picUrl;

  Gamer(
      {this.userId,
      @required this.username,
      this.firstName,
      this.lastName,
      this.picUrl});
}
