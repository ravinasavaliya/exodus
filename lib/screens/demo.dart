// import 'package:flutter/material.dart';
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Status Stories',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.pink,
//         ),
//         home: Home());
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   HomeState createState() => HomeState();
// }
//
// class _HomeState extends State<Home> with TickerProviderStateMixin {
//   AnimationController? animationController;
//
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);
//
//   late final Animation<Offset> _offsetAnimation = Tween<Offset>(
//     begin: Offset.zero,
//     end: const Offset(0.0, 1.5),
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.ease,
//   ));
//
//   @override
//   initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//
//     animationController!.addListener(() => setState(() {}));
//
//     TickerFuture tickerFuture = animationController!.repeat(reverse: true);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.isAnimating ? controller.stop() : _controller.forward();
//     return Scaffold(
//       body: Container(
//         color: Colors.blue,
//         padding: EdgeInsets.symmetric(horizontal: 70),
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               child: Stack(
//                 children: [
//                   SlideTransition(
//                     position: _offsetAnimation,
//                     child: const Text(
//                       'Hello Jenis vaghasiya here, i am \nan flutter \napplication \ndevloper',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 100,
//             ),
//             Container(
//               height: 200,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: animationController!.value * 100,
//                     child: const Text(
//                       'Hello Jenis vaghasiya here, i am \nan flutter \napplication \ndevloper',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
