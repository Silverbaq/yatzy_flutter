import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:yatzy_flutter/game/scoreboard.dart';

class YatzyViewModel extends ViewModel {
  ScoreBoard _scoreBoard = ScoreBoard();
  static const int max_rolls = 3;

  int onces = 0;
  int twos = 0;
  int threes = 0;
  int fours = 0;
  int fives = 0;
  int six = 0;
  int numbersTotal = 0;
  int bonus = 0;

  int aPair = 0;
  int twoPairs = 0;
  int threeOfAKind = 0;
  int fourOfAKind = 0;
  int fiveOfAKind = 0;

  int small = 0;
  int large = 0;
  int royal = 0;

  int fourAndTwo = 0;
  int twoTimesThree = 0;

  int fullHouse = 0;
  int chance = 0;
  int yatzy = 0;

  int total = 0;

  bool isOnceSet = false;
  bool isTwosSet = false;
  bool isThreesSet = false;
  bool isFoursSet = false;
  bool isFivesSet = false;
  bool isSixesSet = false;

  bool isAPairSet = false;
  bool isTwoPairsSet = false;
  bool isThreeOfAKindSet = false;
  bool isFourOfAKindSet = false;
  bool isFiveOfAKindSet = false;

  bool isSmallSet = false;
  bool isLargeSet = false;
  bool isRoyalSet = false;

  bool isFourAndTwoSet = false;
  bool isTwoTimesThreeSet = false;

  bool isFullHouseSet = false;
  bool isChanceSet = false;
  bool isYatzySet = false;

  int dice1 = 1;
  int dice2 = 2;
  int dice3 = 3;
  int dice4 = 4;
  int dice5 = 5;
  int dice6 = 6;

  int rollBonus = 15;

  bool dice1Locked = false;
  bool dice2Locked = false;
  bool dice3Locked = false;
  bool dice4Locked = false;
  bool dice5Locked = false;
  bool dice6Locked = false;

  Color dice1Color = Colors.white;
  Color dice2Color = Colors.white;
  Color dice3Color = Colors.white;
  Color dice4Color = Colors.white;
  Color dice5Color = Colors.white;
  Color dice6Color = Colors.white;

  int rolls = 3;

  rollDices() {
    if (rolls > 0) {
      var random = Random();
      if (!dice1Locked) dice1 = random.nextInt(6)+1;
      if (!dice2Locked) dice2 = random.nextInt(6)+1;
      if (!dice3Locked) dice3 = random.nextInt(6)+1;
      if (!dice4Locked) dice4 = random.nextInt(6)+1;
      if (!dice5Locked) dice5 = random.nextInt(6)+1;
      if (!dice6Locked) dice6 = random.nextInt(6)+1;
      rolls--;
      rollBonus -= 5;
      notifyListeners();
    }
  }

  diceClicked(dice) {
    if (dice == 1) {
      dice1Locked = !dice1Locked;
      if (dice1Color == Colors.white)
        dice1Color = Colors.grey;
      else
        dice1Color = Colors.white;
    } else if (dice == 2) {
      dice2Locked = !dice2Locked;
      if (dice2Color == Colors.white)
        dice2Color = Colors.grey;
      else
        dice2Color = Colors.white;
    } else if (dice == 3) {
      dice3Locked = !dice3Locked;
      if (dice3Color == Colors.white)
        dice3Color = Colors.grey;
      else
        dice3Color = Colors.white;
    } else if (dice == 4) {
      dice4Locked = !dice4Locked;
      if (dice4Color == Colors.white)
        dice4Color = Colors.grey;
      else
        dice4Color = Colors.white;
    } else if (dice == 5) {
      dice5Locked = !dice5Locked;
      if (dice5Color == Colors.white)
        dice5Color = Colors.grey;
      else
        dice5Color = Colors.white;
    } else if (dice == 6) {
      dice6Locked = !dice6Locked;
      if (dice6Color == Colors.white)
        dice6Color = Colors.grey;
      else
        dice6Color = Colors.white;
    }
    notifyListeners();
  }

  clickedOnce () {
    if (!isOnceSet && rolls < max_rolls) {
      int value = _scoreBoard.calcOnes(_getDices());
      isOnceSet = true;
      onces = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedTwos() {
    if (!isTwosSet && rolls < max_rolls) {
      int value = _scoreBoard.calcTwos(_getDices());
      isTwosSet = true;
      twos = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedThrees() {
    if (!isThreesSet && rolls < max_rolls) {
      int value = _scoreBoard.calcThrees(_getDices());
      isThreesSet = true;
      threes = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedFours() {
    if (!isFoursSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFours(_getDices());
      isFoursSet = true;
      fours = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedFives() {
    if (!isFivesSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFives(_getDices());
      isFivesSet = true;
      fives = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedSixes() {
    if (!isSixesSet && rolls < max_rolls) {
      int value = _scoreBoard.calcSixes(_getDices());
      isSixesSet = true;
      six = value;
      numbersTotal += value;
      _calcTotal();
      _checkForBonus();
      _resetRolls();
      notifyListeners();
    }
  }

  clickedAPair() {
    if (!isAPairSet && rolls < max_rolls) {
      int value = _scoreBoard.calcAPair(_getDices()) + rollBonus;
      isAPairSet = true;
      aPair = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedTwoPairs() {
    if (!isTwoPairsSet && rolls < max_rolls) {
      int value = _scoreBoard.calcTwoPairs (_getDices()) + rollBonus;
      isTwoPairsSet = true;
      twoPairs = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedThreeOfAKind() {
    if (!isThreeOfAKindSet && rolls < max_rolls) {
      int value = _scoreBoard.calcThreeOfAKind (_getDices()) + rollBonus;
      isThreeOfAKindSet = true;
      threeOfAKind = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedFourOfAKind() {
    if (!isFourOfAKindSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFourOfAKind (_getDices()) + rollBonus;
      isFourOfAKindSet = true;
      fourOfAKind = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedFiveOfAKind() {
    if (!isFiveOfAKindSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFiveOfAKind (_getDices()) + rollBonus;
      isFiveOfAKindSet = true;
      fiveOfAKind = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }

  clickedSmall() {
    if (!isSmallSet && rolls < max_rolls) {
      int value = _scoreBoard.calcSmall (_getDices()) + rollBonus;
      isSmallSet = true;
      small = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedLarge() {
    if (!isLargeSet && rolls < max_rolls) {
      int value = _scoreBoard.calcLarge (_getDices()) + rollBonus;
      isLargeSet = true;
      large = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedRoyal() {
    if (!isRoyalSet && rolls < max_rolls) {
      int value = _scoreBoard.calcRoyal (_getDices()) + rollBonus;
      isRoyalSet = true;
      royal = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }

  clickedFourAndTwo() {
    if (!isFourAndTwoSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFourAndTwo (_getDices()) + rollBonus;
      isFourAndTwoSet = true;
      fourAndTwo = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedTwoTimesThree() {
    if (!isTwoTimesThreeSet && rolls < max_rolls) {
      int value = _scoreBoard.calcTwoTimesThree (_getDices()) + rollBonus;
      isTwoTimesThreeSet = true;
      twoTimesThree = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }

  clickedFullHouse() {
    if (!isFullHouseSet && rolls < max_rolls) {
      int value = _scoreBoard.calcFullHouse (_getDices()) + rollBonus;
      isFullHouseSet = true;
      fullHouse = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedChance() {
    if (!isChanceSet && rolls < max_rolls) {
      int value = _scoreBoard.calcChance (_getDices()) + rollBonus;
      isChanceSet = true;
      chance = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }
  clickedYatzy() {
    if (!isYatzySet && rolls < max_rolls) {
      int value = _scoreBoard.calcYatzy (_getDices()) + rollBonus;
      isYatzySet = true;
      yatzy = value;
      _calcTotal();
      _resetRolls();
      notifyListeners();
    }
  }

  List<int> _getDices() {
    return [dice1, dice2, dice3, dice4, dice5, dice6];
  }

  _resetRolls() {
    rolls = 3;
    rollBonus = 15;
    dice1Locked = false;
    dice2Locked = false;
    dice3Locked = false;
    dice4Locked = false;
    dice5Locked = false;
    dice6Locked = false;
    dice1Color = Colors.white;
    dice2Color = Colors.white;
    dice3Color = Colors.white;
    dice4Color = Colors.white;
    dice5Color = Colors.white;
    dice6Color = Colors.white;
  }

  _calcTotal() {
    total = onces + twos + threes + fours + fives + six + aPair + twoPairs +
        threeOfAKind + fourOfAKind + fiveOfAKind + small + large + royal +
        fourAndTwo + twoTimesThree + fullHouse + chance + yatzy;
  }

  _checkForBonus() {
    int value = onces + twos + threes + fours + fives + six;
    if (value >= 84) {
      bonus = 50;
    }
  }
}
