// NO USE BUT KEEPING IT FOR NOW


// import 'package:better_munchkin/provider/player_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// class StatsDialog extends ConsumerStatefulWidget {
//   final int? level;
//   final int? bonus;
//   final String name;

//   const StatsDialog({super.key, required this.name, this.level, this.bonus});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _StatsDialogState();
// }

// class _StatsDialogState extends ConsumerState<StatsDialog> {
//   @override
//   Widget build(BuildContext context) {
//     final notifier = ref.read(playerProvider.notifier);

//     return Dialog(
//       child: Container(
//         padding: const EdgeInsets.all(30.0),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//         height: 300.0,
//         width: 300.0,
//         child: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: SleekCircularSlider(
//             appearance: CircularSliderAppearance(
//               size: 400.0,
//               //   angleRange: 100.0,
//               infoProperties: InfoProperties(
//                 modifier: (percentage) => percentage.toInt().toString(),
//               ),
//               customWidths:
//                   CustomSliderWidths(trackWidth: 10.0, progressBarWidth: 10.0),
//             ),
//             min: 1.0,
//             max: 20.0,
//             initialValue: widget.level != null
//                 ? widget.level!.toDouble()
//                 : widget.bonus!.toDouble(),
//             onChangeEnd: (value) {
//               widget.level != null
//                   ? notifier.setLevel(widget.name, value.toInt())
//                   : notifier.setBonus(widget.name, value.toInt());
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
