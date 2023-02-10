import 'dart:math';

import 'package:better_munchkin/utils/commons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class DiceWidget extends StatefulWidget {
  const DiceWidget({super.key});

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  );
  bool isInit = false;
  List<int> diceIcons = const [59799, 59802, 59801, 59798, 59797, 59800];
  late Icon resultDice;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            : RotationTransition(
                turns: _animation,
                child: resultDice,
              ),
      ),
    );
  }

  void diceRoll() {
    // random from 0 to 5 because I use diceIcons index
    int diceResult = Random().nextInt(6);
    if (isInit == false) {
      setState(() {
        isInit = true;
      });
    }

    setState(() {
      resultDice = Icon(
        IconData(diceIcons.elementAt(diceResult),
            fontFamily: "RpgAwesome", fontPackage: "fluttericon"),
        size: 48.0,
      );
    });

    _controller.reset();
    _controller.forward();
  }
}
