import 'package:flutter/material.dart';
import 'package:kingscorer/rows/ceza_hand_row.dart';
import 'package:kingscorer/rows/koz_hand_row.dart';
import 'package:kingscorer/models/models.dart';
import 'package:kingscorer/utils/enums.dart';

List<Widget> getCezaHandsWidgets() {
  List<Widget> kozHandList = <Widget>[];
  hands.where((l) => l.handType == HandType.ceza)?.forEach((Hand h) {
    kozHandList.add(new CezaHandRow(
      cezaHand: h,
    ));
  });
  if (kozHandList == null && kozHandList.length == 0) {
    return <Widget>[Container()];
  }
  return kozHandList;
}

List<Widget> getKozHandsWidgets() {
  List<Widget> kozHandList = <Widget>[];
  hands.where((l) => l.handType == HandType.koz)?.forEach((Hand h) {
    kozHandList.add(new KozHandRow(
      kozHand: h,
    ));
  });
  return kozHandList;
}

String getCezaTypeName(Hand cezaHand) {
  String result;
  switch (cezaHand.cezaType) {
    case CezaType.rifki:
      result = 'Rıfkı';
      break;
    case CezaType.kizAlmaz:
      result = 'Kız Almaz';
      break;
    case CezaType.erkekAlmaz:
      result = 'Erkek Almaz';
      break;
    case CezaType.elAlmaz:
      result = 'El Almaz';
      break;
    case CezaType.kupaAlmaz:
      result = 'Kupa Almaz';
      break;
    case CezaType.sonIki:
      result = 'Son İki';
      break;
    default:
      result = 'Error';
  }

  result = (cezaHand.turnCount - 1).toString() + '.' + result;
  return result;
}

String getCezaTypeName2(Hand cezaHand) {
  String result;
  switch (cezaHand.cezaType) {
    case CezaType.rifki:
      result = 'Rıfkı';
      break;
    case CezaType.kizAlmaz:
      result = 'Kız Almaz';
      break;
    case CezaType.erkekAlmaz:
      result = 'Erkek Almaz';
      break;
    case CezaType.elAlmaz:
      result = 'El Almaz';
      break;
    case CezaType.kupaAlmaz:
      result = 'Kupa Almaz';
      break;
    case CezaType.sonIki:
      result = 'Son İki';
      break;
    default:
      result = 'Error';
  }

  return result;
}

String getKozTypeName(Hand kozHand) {
  String result;
  switch (kozHand.kozType) {
    case KozType.karo:
      result = 'Koz Karo';
      break;
    case KozType.kupa:
      result = 'Koz Kupa';
      break;
    case KozType.maca:
      result = 'Koz Maça';
      break;
    case KozType.sinek:
      result = 'Koz Sinek';
      break;
    default:
      result = 'Error';
  }

  result = (kozHand.turnCount - 1).toString() + '.' + result;
  return result;
}

String getKozTypeName2(Hand kozHand) {
  String result;
  switch (kozHand.kozType) {
    case KozType.karo:
      result = 'Koz Karo';
      break;
    case KozType.kupa:
      result = 'Koz Kupa';
      break;
    case KozType.maca:
      result = 'Koz Maça';
      break;
    case KozType.sinek:
      result = 'Koz Sinek';
      break;
    default:
      result = 'Error';
  }

  return result;
}

int getCezaPointInt(CezaType cezaType, int count) {
  int total;
  switch (cezaType) {
    case CezaType.rifki:
      total = 320 * count;
      break;
    case CezaType.kizAlmaz:
      total = 100 * count;
      break;
    case CezaType.erkekAlmaz:
      total = 60 * count;
      break;
    case CezaType.elAlmaz:
      total = 50 * count;
      break;
    case CezaType.kupaAlmaz:
      total = 30 * count;
      break;
    case CezaType.sonIki:
      total = 180 * count;
      break;
    default:
      total = 0;
  }
  return total;
}

int getMaxHandCount() {
  return hands.length - 1;
}

int getUserCezaTotal(int user) {
  int total = 0;
  switch (user) {
    case 1:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        total += getCezaPointInt(a.cezaType, a.gamer1Result);
      });
      break;
    case 2:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        total += getCezaPointInt(a.cezaType, a.gamer2Result);
      });
      break;
    case 3:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        total += getCezaPointInt(a.cezaType, a.gamer3Result);
      });
      break;
    case 4:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        total += getCezaPointInt(a.cezaType, a.gamer4Result);
      });
      break;
    default:
      total = 0;
  }
  return total;
}

int getUserKozTotal(int user) {
  int total = 0;
  switch (user) {
    case 1:
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        total += 50 * a.gamer1Result;
      });
      break;
    case 2:
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        total += 50 * a.gamer2Result;
      });
      break;
    case 3:
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        total += 50 * a.gamer3Result;
      });
      break;
    case 4:
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        total += 50 * a.gamer4Result;
      });
      break;
    default:
      total = 0;
  }
  return total;
}

int getGeneralTotal(int user) {
  int totalCeza = 0;
  int totalKoz = 0;
  switch (user) {
    case 1:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        totalCeza += getCezaPointInt(a.cezaType, a.gamer1Result);
      });
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        totalKoz += 50 * a.gamer1Result;
      });
      break;
    case 2:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        totalCeza += getCezaPointInt(a.cezaType, a.gamer2Result);
      });
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        totalKoz += 50 * a.gamer2Result;
      });
      break;
    case 3:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        totalCeza += getCezaPointInt(a.cezaType, a.gamer3Result);
      });
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        totalKoz += 50 * a.gamer3Result;
      });
      break;
    case 4:
      hands.where((l) => l.handType == HandType.ceza).forEach((Hand a) {
        totalCeza += getCezaPointInt(a.cezaType, a.gamer4Result);
      });
      hands.where((l) => l.handType == HandType.koz).forEach((Hand a) {
        totalKoz += 50 * a.gamer4Result;
      });
      break;
    default:
      totalKoz = 0;
  }
  return totalKoz - totalCeza;
}

Gamer getNextGamerHands() {
  Gamer nextGamer;
  if (hands.length == 1) {
    return hands[0].turnGamer;
  }
  if (hands.last.turnGamer.username == hands.last.gamer1.username) {
    nextGamer = hands.last.gamer2;
  } else if (hands.last.turnGamer.username == hands.last.gamer2.username) {
    nextGamer = hands.last.gamer3;
  } else if (hands.last.turnGamer.username == hands.last.gamer3.username) {
    nextGamer = hands.last.gamer4;
  } else if (hands.last.turnGamer.username == hands.last.gamer4.username) {
    nextGamer = hands.last.gamer1;
  }

  return nextGamer;
}

int getCezaCount(int gamerIndex) {
  int count = 0;
  String gamerUsername;
  switch (gamerIndex) {
    case 1:
      gamerUsername = hands[0]?.gamer1?.username;
      break;
    case 2:
      gamerUsername = hands[0]?.gamer2?.username;
      break;
    case 3:
      gamerUsername = hands[0]?.gamer3?.username;
      break;
    case 4:
      gamerUsername = hands[0]?.gamer4?.username;
      break;
    default:
  }

  count = hands
      .where((l) =>
          l.turnGamer.username == gamerUsername && l.handType == HandType.ceza)
      ?.length;
  return count;
}

int getKozCount(int gamerIndex) {
  int count = 0;
  String gamerUsername;
  switch (gamerIndex) {
    case 1:
      gamerUsername = hands[0]?.gamer1?.username;
      break;
    case 2:
      gamerUsername = hands[0]?.gamer2?.username;
      break;
    case 3:
      gamerUsername = hands[0]?.gamer3?.username;
      break;
    case 4:
      gamerUsername = hands[0]?.gamer4?.username;
      break;
    default:
  }

  count = hands
      .where((l) =>
          l.turnGamer.username == gamerUsername && l.handType == HandType.koz)
      ?.length;
  return count;
}

bool canSelectThisGame(HandType handType) {
  Gamer turnGamer = getNextGamerHands();
  int canSelect = 0;
  if (handType == HandType.ceza) {
    hands
        .where((l) =>
            l.handType == HandType.ceza &&
            l.turnGamer.username == turnGamer.username)
        .forEach((Hand a) {
      canSelect += 1;
    });
    if (canSelect == 3) {
      return false;
    }
  } else if (handType == HandType.koz) {
    hands
        .where((l) =>
            l.handType == HandType.koz &&
            l.turnGamer.username == turnGamer.username)
        .forEach((Hand a) {
      canSelect += 1;
    });
    if (canSelect == 2) {
      return false;
    }
  }
  return true;
}

int getSelectableGames(HandType handType, CezaType cezaType, KozType kozType) {
  int restCount = 0;
  if (handType == HandType.ceza) {
    switch (cezaType) {
      case CezaType.rifki:
        hands
            .where((l) =>
                l.handType == HandType.ceza && l.cezaType == CezaType.rifki)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case CezaType.elAlmaz:
        hands
            .where((l) =>
                l.handType == HandType.ceza && l.cezaType == CezaType.elAlmaz)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case CezaType.erkekAlmaz:
        hands
            .where((l) =>
                l.handType == HandType.ceza &&
                l.cezaType == CezaType.erkekAlmaz)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case CezaType.kizAlmaz:
        hands
            .where((l) =>
                l.handType == HandType.ceza && l.cezaType == CezaType.kizAlmaz)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case CezaType.kupaAlmaz:
        hands
            .where((l) =>
                l.handType == HandType.ceza && l.cezaType == CezaType.kupaAlmaz)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case CezaType.sonIki:
        hands
            .where((l) =>
                l.handType == HandType.ceza && l.cezaType == CezaType.sonIki)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      default:
        restCount = 0;
    }
  } else if (handType == HandType.koz) {
    switch (kozType) {
      case KozType.kupa:
        hands
            .where(
                (l) => l.handType == HandType.koz && l.kozType == KozType.kupa)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case KozType.karo:
        hands
            .where(
                (l) => l.handType == HandType.koz && l.kozType == KozType.karo)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case KozType.maca:
        hands
            .where(
                (l) => l.handType == HandType.koz && l.kozType == KozType.maca)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      case KozType.sinek:
        hands
            .where(
                (l) => l.handType == HandType.koz && l.kozType == KozType.sinek)
            .forEach((Hand a) {
          restCount += 1;
        });
        break;
      default:
        restCount = 0;
    }
  }

  return 2 - restCount;
}

Hand updateNewHandWidget(int index) {
  Hand newHand;
  switch (index) {
    case 1:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.rifki,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 2:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.sonIki,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 3:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.erkekAlmaz,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 4:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.kizAlmaz,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 5:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.elAlmaz,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 6:
      newHand = new Hand(
          handType: HandType.ceza,
          cezaType: CezaType.kupaAlmaz,
          kozType: null,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 7:
      newHand = new Hand(
          handType: HandType.koz,
          cezaType: null,
          kozType: KozType.kupa,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 8:
      newHand = new Hand(
          handType: HandType.koz,
          cezaType: null,
          kozType: KozType.karo,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 9:
      newHand = new Hand(
          handType: HandType.koz,
          cezaType: null,
          kozType: KozType.maca,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    case 10:
      newHand = new Hand(
          handType: HandType.koz,
          cezaType: null,
          kozType: KozType.sinek,
          turnCount: hands.length + 1,
          turnGamer: getNextGamerHands(),
          gamer1: hands.last.gamer1,
          gamer1Result: 0,
          gamer2: hands.last.gamer2,
          gamer2Result: 0,
          gamer3: hands.last.gamer3,
          gamer3Result: 0,
          gamer4: hands.last.gamer4,
          gamer4Result: 0);
      break;
    default:
      return null;
  }
  return newHand;
}

void pushNewHand(Hand newHand) {
  hands.add(newHand);
}

void pushInitialGamerName(Map<String, dynamic> newData, int radioValue) {
  var gamer1 = new Gamer(
    username: newData['gamer1'].toString().trim(),
  );
  var gamer2 = new Gamer(
    username: newData['gamer2'].toString().trim(),
  );
  var gamer3 = new Gamer(
    username: newData['gamer3'].toString().trim(),
  );
  var gamer4 = new Gamer(
    username: newData['gamer4'].toString().trim(),
  );

  Hand newHand = new Hand(
      handType: null,
      cezaType: null,
      kozType: null,
      turnCount: 0,
      turnGamer: radioValue == 0
          ? gamer1
          : radioValue == 1
              ? gamer2
              : radioValue == 2 ? gamer3 : radioValue == 3 ? gamer4 : null,
      gamer1: gamer1,
      gamer1Result: null,
      gamer2: gamer2,
      gamer2Result: null,
      gamer3: gamer3,
      gamer3Result: null,
      gamer4: gamer4,
      gamer4Result: null);

  pushNewHand(newHand);
}

bool isHandEmpty() {
  return hands.length > 1 ? false : true;
}

int getHandLength() {
  return hands.length;
}

void deleteLastGame() {
  hands.removeLast();
}

void resetCurrentGame(){
  hands.removeRange(1, hands.length);
}

void startNewGame(){
  hands = [];
}

String capitalize(String input) {
  if (input == null) {
    throw new ArgumentError("string: $input");
  }
  if (input.length == 0) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

String mySubString(String str, int b){

  String tmpStr="";

  if(str == null){
    return "";
  }
  if(str.length==1 || str.length==b){
    return str;
  }

  for(int i=0; i<str.length;i++){
    if(i < b){
      tmpStr += str[i];
    }
  }

  return tmpStr;
}

bool areDiffUserNames(Map<String, dynamic> formData){

  for(int i=0; i<4; i++){
    for(int j=i+1; j<4; j++){
      if(formData['gamer${i+1}'] == formData['gamer${j+1}']){
        return false;
      }
    }
  }
  return true;
}