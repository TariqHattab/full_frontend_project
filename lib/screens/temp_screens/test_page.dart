// import 'package:flutter/material.dart';

// class TestPage extends StatelessWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SomeWidget(),
//           SomeWidget(),
//           SomeWidget(),
//           SomeWidget(),
//           SomeWidget(),
//         ],
//       ),
//     );
//   }
// }

// class SomeWidget extends StatefulWidget {
//   @override
//   _SomeWidgetState createState() => _SomeWidgetState();
// }

// class _SomeWidgetState extends State<SomeWidget> {
//   final _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       print(
//           "Has focus: ${_focusNode.hasFocus} and the hash is ${_focusNode.hashCode}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return buildtxtTest(focusNode: _focusNode);
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
// }

// buildtxtTest({FocusNode? focusNode}) {
//   return TextFormField(focusNode: focusNode);
// }
