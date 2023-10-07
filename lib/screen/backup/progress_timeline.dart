// import 'package:flutter/material.dart';

// import 'package:progress_timeline/progress_timeline.dart';

// class ProgressTimeline extends StatefulWidget {
//   const ProgressTimeline({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<ProgressTimeline> {
//   late ProgressTimeline progressTimeline;

//   //late List<SingleState> states;

//   List<SingleState> states = [
//     SingleState(stateTitle: "Stage 1"),
//     SingleState(stateTitle: "Stage 2"),
//     SingleState(stateTitle: "Stage 3"),
//     SingleState(stateTitle: "Stage 4"),
//     SingleState(stateTitle: "Stage 5"),
//     SingleState(stateTitle: "Stage 6"),
//     SingleState(stateTitle: "Stage 7"),
//     SingleState(stateTitle: "Stage 8"),
//   ];

//   @override
//   void initState() {
//     // screenProgress = const ProgressTimeline(
//     //   states: allStages,
//     // );
//     super.initState();
//     progressTimeline = const ProgressTimeline();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Demo'),
//       ),
//       body: Center(
//         child: Column(
// //          crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: progressTimeline,
//             ),
//             const SizedBox(
//               height: 90,
//             ),
//             TextButton(
//               child: const Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Next Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               // color: Colors.green,
//               // shape: new RoundedRectangleBorder(
//               //     borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 //screenProgress.gotoNextStage();
//               },
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//               child: const Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   "Goto Previous Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               // color: Colors.green,
//               // shape: new RoundedRectangleBorder(
//               //     borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 //screenProgress.gotoPreviousStage();
//               },
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//               child: const Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   "Fail Current Stage",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               // color: Colors.green,
//               // shape: new RoundedRectangleBorder(
//               //     borderRadius: new BorderRadius.circular(20.0)),
//               onPressed: () {
//                 //screenProgress.failCurrentStage();
//               },
//             )
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
