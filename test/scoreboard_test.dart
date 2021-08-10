import 'package:flutter_test/flutter_test.dart';
import 'package:yatzy_flutter/game/scoreboard.dart';

ScoreBoard scoreBoard = ScoreBoard();

void main() {
  test('calc ones', () {
    var dies = [1, 1, 1, 1, 2, 3];

    var actual = scoreBoard.calcOnes(dies);

    expect(actual, 4);
  });

  test('calc twos', () {
    var dies = [1, 1, 1, 2, 2, 2];

    var actual = scoreBoard.calcTwos(dies);

    expect(actual, 6);
  });

  test('calc threes', () {
    var dies = [1, 3, 3, 3, 2, 3];

    var actual = scoreBoard.calcThrees(dies);

    expect(actual, 12);
  });

  test('calc fours', () {
    var dies = [4, 4, 1, 4, 2, 3];

    var actual = scoreBoard.calcFours(dies);

    expect(actual, 12);
  });

  test('calc fives', () {
    var dies = [5, 1, 5, 1, 5, 3];

    var actual = scoreBoard.calcFives(dies);

    expect(actual, 15);
  });

  test('calc sixes', () {
    var dies = [6, 1, 6, 1, 2, 3];

    var actual = scoreBoard.calcSixes(dies);

    expect(actual, 12);
  });

  test('calc a pair', () {
    var dies = [6, 1, 6, 1, 2, 3];
    var actual = scoreBoard.calcAPair(dies);
    expect(actual, 12);

    var dies2 = [6, 1, 5, 4, 2, 3];
    var actual2 = scoreBoard.calcAPair(dies2);
    expect(actual2, 0);
  });

  test('calc two pairs', () {
    var dies = [6, 1, 6, 1, 2, 2];
    var actual = scoreBoard.calcTwoPairs(dies);
    expect(actual, 16);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcTwoPairs(dies2);
    expect(actual2, 0);
  });

  test('calc three pairs', () {
    var dies = [6, 1, 6, 1, 2, 2];
    var actual = scoreBoard.calcThreePairs(dies);
    expect(actual, 18);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcThreePairs(dies2);
    expect(actual2, 0);
  });

  test('calc three of a kind', () {
    var dies = [6, 1, 2, 1, 2, 2];
    var actual = scoreBoard.calcThreeOfAKind(dies);
    expect(actual, 6);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcThreeOfAKind(dies2);
    expect(actual2, 0);

    var dies3 = [5, 5, 5, 2, 2, 2];
    var actual3 = scoreBoard.calcThreeOfAKind(dies3);
    expect(actual3, 15);
  });

  test('calc four of a kind', () {
    var dies = [6, 1, 2, 2, 2, 2];
    var actual = scoreBoard.calcFourOfAKind(dies);
    expect(actual, 8);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcFourOfAKind(dies2);
    expect(actual2, 0);
  });

  test('calc five of a kind', () {
    var dies = [6, 2, 2, 2, 2, 2];
    var actual = scoreBoard.calcFiveOfAKind(dies);
    expect(actual, 10);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcFiveOfAKind(dies2);
    expect(actual2, 0);
  });

  test('calc small', () {
    var dies = [1, 2, 3, 4, 5, 5];
    var actual = scoreBoard.calcSmall(dies);
    expect(actual, 15);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcSmall(dies2);
    expect(actual2, 0);
  });

  test('calc large', () {
    var dies = [2, 2, 3, 4, 5, 6];
    var actual = scoreBoard.calcLarge(dies);
    expect(actual, 20);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcLarge(dies2);
    expect(actual2, 0);
  });

  test('calc royal', () {
    var dies = [1, 2, 3, 4, 5, 6];
    var actual = scoreBoard.calcRoyal(dies);
    expect(actual, 30);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcRoyal(dies2);
    expect(actual2, 0);
  });

  test('calc four and two', () {
    var dies = [1, 1, 5, 5, 5, 5];
    var actual = scoreBoard.calcFourAndTwo(dies);
    expect(actual, 22);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcFourAndTwo(dies2);
    expect(actual2, 0);
  });

  test('calc two times three', () {
    var dies = [1, 1, 1, 5, 5, 5];
    var actual = scoreBoard.calcTwoTimesThree(dies);
    expect(actual, 18);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcTwoTimesThree(dies2);
    expect(actual2, 0);
  });

  test('calc full house', () {
    var dies = [3, 1, 1, 5, 5, 5];
    var actual = scoreBoard.calcFullHouse(dies);
    expect(actual, 17);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcFullHouse(dies2);
    expect(actual2, 0);
  });

  test('calc chance', () {
    var dies = [3, 1, 1, 5, 5, 5];
    var actual = scoreBoard.calcChance(dies);
    expect(actual, 20);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcChance(dies2);
    expect(actual2, 24);
  });

  test('calc yatzy', () {
    var dies = [1, 1, 1, 1, 1, 1];
    var actual = scoreBoard.calcYatzy(dies);
    expect(actual, 56);

    var dies2 = [6, 4, 6, 1, 5, 2];
    var actual2 = scoreBoard.calcYatzy(dies2);
    expect(actual2, 0);
  });
}
