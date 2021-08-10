import 'dart:math';

class ScoreBoard {
  var ones;
  var twos;
  var threes;
  var fours;
  var fives;
  var sixes;

  var aPair;
  var twoPairs;
  var threePairs;
  var threeOfAKind;
  var fourOfAKind;
  var fiveOfAKind;

  var small;
  var large;
  var royal;

  var fourAndTwo;
  var twoTimesThree;

  var fullHouse;
  var chance;
  var yatzy;

  int calcOnes(List<int> dices) {
    return dices.where((die) => die == 1).reduce((a, b) => a + b);
  }

  int calcTwos(List<int> dices) {
    return dices.where((die) => die == 2).reduce((a, b) => a + b);
  }

  int calcThrees(List<int> dices) {
    return dices.where((die) => die == 3).reduce((a, b) => a + b);
  }

  int calcFours(List<int> dices) {
    return dices.where((die) => die == 4).reduce((a, b) => a + b);
  }

  int calcFives(List<int> dices) {
    return dices.where((die) => die == 5).reduce((a, b) => a + b);
  }

  int calcSixes(List<int> dices) {
    return dices.where((die) => die == 6).reduce((a, b) => a + b);
  }

  int calcAPair(List<int> dices) {
    var counts = _makeMap(dices);

    var result = 0;
    counts.forEach((key, value) {
      if (value > 1 && key > result) {
        result = key;
      }
    });

    return result * 2;
  }

  int calcTwoPairs(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 2);
    if (counts.length < 2) {
      return 0;
    } else {
      var first = counts.keys.reduce(max);
      counts.remove(first);
      var second = counts.keys.reduce(max);
      return (first * 2) + (second * 2);
    }
  }

  int calcThreePairs(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 2);
    if (counts.length < 3) {
      return 0;
    } else {
      var first = counts.keys.reduce(max);
      counts.remove(first);
      var second = counts.keys.reduce(max);
      var third = counts.keys.reduce(min);
      return (first * 2) + (second * 2) + (third * 2);
    }
  }

  calcThreeOfAKind(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 3);
    if (counts.isEmpty) {
      return 0;
    } else {
      var highest = counts.keys.reduce(max);
      return highest * 3;
    }
  }

  int calcFourOfAKind(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 4);
    if (counts.isEmpty) {
      return 0;
    } else {
      var highest = counts.keys.reduce(max);
      return highest * 4;
    }
  }

  int calcFiveOfAKind(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 5);
    if (counts.isEmpty) {
      return 0;
    } else {
      var highest = counts.keys.reduce(max);
      return highest * 5;
    }
  }

  int calcSmall(List<int> dices) {
    if (dices.contains(1) &&
        dices.contains(2) &&
        dices.contains(3) &&
        dices.contains(4) &&
        dices.contains(5)) {
      return 15;
    } else {
      return 0;
    }
  }

  int calcLarge(List<int> dices) {
    if (dices.contains(2) &&
        dices.contains(3) &&
        dices.contains(4) &&
        dices.contains(5) &&
        dices.contains(6)) {
      return 20;
    } else {
      return 0;
    }
  }

  int calcRoyal(List<int> dices) {
    if (dices.contains(1) &&
        dices.contains(2) &&
        dices.contains(3) &&
        dices.contains(4) &&
        dices.contains(5) &&
        dices.contains(6)) {
      return 30;
    } else {
      return 0;
    }
  }

  int calcFourAndTwo(List<int> dices) {
    var counts = _makeMap(dices);

    var hasFour = counts.containsValue(4);
    var hasTwo = counts.containsValue(2);
    if (hasFour && hasTwo) {
      return counts.entries.fold(0,(a, b) =>  a + (b.key * b.value));
    } else {
    return 0;
    }
  }

  int calcTwoTimesThree(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 3);
    if (counts.length == 2) {
      return counts.entries.fold(0,(a, b) =>  a + (b.key * b.value));
    } else {
      return 0;
    }
  }

  int calcFullHouse(List<int> dices) {
    var counts = _makeMap(dices);

    counts.removeWhere((key, value) => value < 2);
    var hasThree = counts.containsValue(3) || counts.containsValue(4);
    var hasTwo = counts.containsValue(2);
    if (hasThree && hasTwo) {
      return counts.entries.fold(0,(a, b) =>  a + (b.key * b.value));
    } else {
      return 0;
    }
  }

  int calcChance(List<int> dices) {
    var counts = _makeMap(dices);
    return counts.entries.fold(0, (previousValue, element) => previousValue + (element.value * element.key));
  }

  int calcYatzy(List<int> dices) {
    var counts = _makeMap(dices);
    counts.removeWhere((key, value) => value < 6);
    if (counts.isEmpty) {
      return 0;
    } else {
      return 50 + counts.entries.fold(0, (previousValue, element) => previousValue + (element.value * element.key));
    }
  }

  Map<int,int> _makeMap(List<int> dices) {
    Map<int, int> counts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};
    dices.forEach((die) {
      var number = counts[die] ?? 0;
      counts[die] = number + 1;
    });
    return counts;
  }
}
