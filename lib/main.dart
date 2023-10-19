// void main is main method that directly invoked by application for execution by dart program
// after execution of main method dart compiles it into native code and decide wether its a ios or android
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container_diece.dart';

void main() {
  // runApp() is a method provided by flutter
  // runApp() is built in fluterr app which comes with binding it with fluteer
  // runApp() is not inbuilt in dart
  // runApp() method main task is used to display some ui in a screen
  // runApp() takes at  one argument which is type of widget
  // runApp() method of ui should contain tree structure ui

  // runApp(const MaterialApp(home: Text("Hello world")));
  // runApp(
  //   const MaterialApp(
  //     // Scanffold occupies all the spaces available in screen
  //     home: Scaffold(
  //       // setting backgound color by simple using color class
  //       // backgroundColor: Colors.amber,
  //       body: Center(
  //           child: Text(
  //         "Hello world2",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       )),
  //     ),
  //   ),
  // );

  // example 2 for displaying ui with gradient background color
  // runApp(
  //   MaterialApp(
  //     // Scanffold occupies all the spaces available in screen
  //     home: Scaffold(
  //       // setting backgound color by simple using color class
  //       // backgroundColor: Colors.amber,
  //       body: Container(
  //         decoration: const BoxDecoration(
  //           gradient: LinearGradient(colors: [
  //             Colors.purpleAccent,
  //             Color.fromARGB(255, 184, 12, 150),
  //             Colors.deepPurpleAccent
  //           ], begin: Alignment.topLeft, end: Alignment.bottomRight),
  //         ),
  //         child: const Center(
  //           child: Text(
  //             "Hello world2",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 28,
  //                 decoration: TextDecoration.underline),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );

  // example 3 for displaying ui by class method
  // stateless
  runApp(
    MaterialApp(
      // Scanffold occupies all the spaces available in screen
      home: Scaffold(
        // setting backgound color by simple using color class
        // backgroundColor: Colors.amber,
        body: GradientContainer(
            Colors.purpleAccent,
            Color.fromARGB(255, 184, 12, 150),
            Color.fromARGB(255, 217, 57, 57)),
      ),
    ),
  );
  // statefull
  // runApp(
  //   const MaterialApp(
  //     // Scanffold occupies all the spaces available in screen
  //     home: Scaffold(
  //       // setting backgound color by simple using color class
  //       // backgroundColor: Colors.amber,
  //       body: GradientContainer(
  //           color1: Colors.purpleAccent,
  //           colorMid: Color.fromARGB(255, 184, 12, 150),
  //           color2: Color.fromARGB(255, 217, 57, 57)),
  //     ),
  //   ),
  // );
}

// created custom widget by inheriting StatelessWidget class
//after inheriting Stateless widget class need to override build(context) method where we need to return widget component
