import 'dart:math';

import 'package:better_munchkin/utils/commons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class DiceWidget extends StatefulWidget {
  // TODO: LATER: Rive & 1 animation for each dice side
  // TODO: add animation
  const DiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  bool isInit = false;
  List<Icon> diceIcons = const [
    Icon(RpgAwesome.dice_one, size: 42.0),
    Icon(RpgAwesome.dice_two, size: 42.0),
    Icon(RpgAwesome.dice_three, size: 42.0),
    Icon(RpgAwesome.dice_four, size: 42.0),
    Icon(RpgAwesome.dice_five, size: 42.0),
    Icon(RpgAwesome.dice_six, size: 42.0)
  ];

  late Icon resultDice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: GestureDetector(
          onTap: () => diceRoll(),
          child: isInit == false
              ? const Icon(
                  RpgAwesome.perspective_dice_six_two,
                  size: 52.0,
                )
              : resultDice),
    );
  }

  void diceRoll() {
    // random from 0 to 5 because I use diceIcons index
    int result = Random().nextInt(5);
    if (isInit == false) {
      setState(() {
        isInit = true;
      });
    }
    setState(() {
      resultDice = diceIcons.elementAt(result);
    });
  }
}
