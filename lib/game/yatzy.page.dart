import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:yatzy_flutter/game/yatzy.viewmodel.dart';

class YatzyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(
        view: (context, vmodel) => _YatzyPage(), viewModel: YatzyViewModel());
  }
}

class _YatzyPage extends StatelessView<YatzyViewModel> {
  @override
  Widget render(BuildContext context, YatzyViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        YatzyRow('Ones', viewModel.onces, viewModel.isOnceSet, viewModel.clickedOnce),
                        YatzyRow('Twos', viewModel.twos, viewModel.isTwosSet, viewModel.clickedTwos),
                        YatzyRow('Threes', viewModel.threes, viewModel.isThreesSet, viewModel.clickedThrees),
                        YatzyRow('Fours', viewModel.fours, viewModel.isFoursSet, viewModel.clickedFours),
                        YatzyRow('Fives', viewModel.fives, viewModel.isFivesSet, viewModel.clickedFives),
                        YatzyRow('Sixes', viewModel.six, viewModel.isSixesSet, viewModel.clickedSixes),
                        Divider(color: Colors.black),
                        YatzyRow('Sum', viewModel.numbersTotal, true, print),
                        Divider(color: Colors.black),
                        YatzyRow('Bonus', viewModel.bonus, true, print),
                        Divider(color: Colors.black),
                        YatzyRow('A Pair', viewModel.aPair, viewModel.isAPairSet, viewModel.clickedAPair),
                        YatzyRow('Two Pairs', viewModel.twoPairs, viewModel.isTwoPairsSet, viewModel.clickedTwoPairs),
                        YatzyRow('Three of a kind', viewModel.threeOfAKind, viewModel.isThreeOfAKindSet, viewModel.clickedThreeOfAKind),
                        YatzyRow('Four of a kind', viewModel.fourOfAKind, viewModel.isFourOfAKindSet, viewModel.clickedFourOfAKind),
                        YatzyRow('Five of a kind', viewModel.fiveOfAKind, viewModel.isFiveOfAKindSet, viewModel.clickedFiveOfAKind),
                        Divider(color: Colors.black),
                        YatzyRow('Small', viewModel.small, viewModel.isSmallSet, viewModel.clickedSmall),
                        YatzyRow('Large', viewModel.large, viewModel.isLargeSet, viewModel.clickedLarge),
                        YatzyRow('Royal', viewModel.royal, viewModel.isRoyalSet, viewModel.clickedRoyal),
                        Divider(color: Colors.black),
                        YatzyRow('Four and Two', viewModel.fourAndTwo, viewModel.isFourAndTwoSet, viewModel.clickedFourAndTwo),
                        YatzyRow('Two times Three', viewModel.twoTimesThree, viewModel.isTwoTimesThreeSet, viewModel.clickedTwoTimesThree),
                        Divider(color: Colors.black),
                        YatzyRow('Full house', viewModel.fullHouse, viewModel.isFullHouseSet, viewModel.clickedFullHouse),
                        YatzyRow('Chance', viewModel.chance, viewModel.isChanceSet, viewModel.clickedChance),
                        YatzyRow('Yatzy', viewModel.yatzy, viewModel.isYatzySet, viewModel.clickedYatzy),
                        Divider(color: Colors.black),
                        YatzyRow('Total', viewModel.total, true, print),
                        Divider(color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: viewModel.dice1Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice1), onTap: () => viewModel.diceClicked(1),),
                            )),
                            Container(
                                color: viewModel.dice2Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice2), onTap: () => viewModel.diceClicked(2),),
                            )),
                            Container(
                                color: viewModel.dice3Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice3), onTap: () => viewModel.diceClicked(3),),
                            )),
                            Container(
                                color: viewModel.dice4Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice4), onTap: () => viewModel.diceClicked(4),),
                            )),
                            Container(
                                color: viewModel.dice5Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice5), onTap: () => viewModel.diceClicked(5),),
                            )),
                            Container(
                                color: viewModel.dice6Color, child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(child: DiceWidget(viewModel.dice6), onTap: () => viewModel.diceClicked(6),),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => viewModel.rollDices(),
                          child: Text(viewModel.rolls > 0 ? 'Roll (${viewModel.rolls} left)' : 'No rolls left'),
                        ),
                      ),
                      Text(viewModel.rolls == 0 ? 'Roll Bonus +0' : viewModel.rolls == 1 ? 'Roll Bonus +5' : 'Roll Bonus +10')
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiceWidget extends StatelessWidget {
  DiceWidget(this.value);
  int value;

  @override
  Widget build(BuildContext context) {
    if (value == 1) return Image.asset('assets/images/dice1.png', height: 50);
    else if (value == 2) return Image.asset('assets/images/dice2.png', height: 50);
    else if (value == 3) return Image.asset('assets/images/dice3.png', height: 50);
    else if (value == 4) return Image.asset('assets/images/dice4.png', height: 50);
    else if (value == 5) return Image.asset('assets/images/dice5.png', height: 50);
    else return Image.asset('assets/images/dice6.png', height: 50);
  }
}

class YatzyRow extends StatelessWidget {
  YatzyRow(this._title, this._value, this._isSet, this._function);

  String _title;
  int _value;
  Function _function;
  bool _isSet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {_function(); },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(_title), Text(_isSet ? _value.toString() : '') ], ),
        ));
  }

}
