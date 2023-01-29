// NEUMORPHIC IS UGLY

// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// class CustomButton extends StatefulWidget {
//   final String text;
//   final Widget widg;

//   const CustomButton({super.key, required this.text, required this.widg});

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   bool isPressed = true;

//   @override
//   Widget build(BuildContext context) {
//     Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
//     double blur = isPressed ? 5.0 : 30.0;

//     return Listener(
//       onPointerDown: (event) {
//         setState(() => isPressed = true);
//         showDialog(
//           context: context,
//           builder: (context) => widget.widg,
//         );
//       },
//       onPointerUp: (event) => setState(() => isPressed = false),
//       child: AnimatedContainer(
//         height: 34.0,
//         width: 124.0,
//         duration: const Duration(milliseconds: 100),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: blur,
//                 offset: -distance,
//                 color: Colors.white,
//                 inset: isPressed),
//             BoxShadow(
//                 blurRadius: blur,
//                 offset: distance,
//                 color: const Color(0xFFA7A9AF),
//                 inset: isPressed),
//           ],
//         ),
//         child: Center(
//           child: Text(widget.text),
//         ),
//       ),
//     );
//   }
// }
