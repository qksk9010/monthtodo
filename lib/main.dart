import 'package:flutter/material.dart';
import 'package:monthtodo/screens/home_screen.dart';
//import 'package:flex_list/flex_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isDarkMode = false;
  List<double> flexArray = [5, 10, 3, 15, 7, 20, 200];
  double sizeFlexList = 5 + 10 + 3 + 15 + 7 + 20;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'FlexList Demo',
    //     theme: ThemeData(),
    //     home: Scaffold(
    //       body: Center(
    //         child: SizedBox(
    //             width: 300,
    //             child: FlexList(
    //               horizontalSpacing: 5,
    //               verticalSpacing: 10,
    //               children: [
    //                 for (var i = 0; i < flexArray.length; i++)
    //                   Container(
    //                     color: Colors.yellow,
    //                     padding: (() {
    //                       if (flexArray[i] > 300) {
    //                         return const EdgeInsets.symmetric(
    //                             horizontal: 300, vertical: 10);
    //                       } else {
    //                         return EdgeInsets.symmetric(
    //                             horizontal: flexArray[i], vertical: 10);
    //                       }
    //                     })(),
    //                     child: Text("Item $i"),
    //                   )
    //               ],
    //             )),
    //       ),
    //     ));
    return MaterialApp(home: HomeScreen(isDarkMode: isDarkMode));
  }
}
