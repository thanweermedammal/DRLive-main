// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   String text = "hi";
//   bool isCurrentUser = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff6b0772),
//       body: Padding(
//         // asymmetric padding
//         padding: EdgeInsets.fromLTRB(
//           isCurrentUser ? 64.0 : 16.0,
//           4,
//           isCurrentUser ? 16.0 : 64.0,
//           4,
//         ),
//         child: Align(
//           // align the child within the container
//           alignment:
//               isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
//           child: DecoratedBox(
//             // chat bubble decoration
//             decoration: BoxDecoration(
//               color: isCurrentUser ? Colors.blue : Colors.grey[300],
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 text,
//                 style: Theme.of(context).textTheme.bodyText1.copyWith(
//                     color: isCurrentUser ? Colors.white : Colors.black87),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
