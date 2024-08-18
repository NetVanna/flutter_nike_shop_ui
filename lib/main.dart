import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/view/navigator.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand"
      ),
      title: "Sneaker Shop app",
      home: const MainNavigator(),
    );
  }
}
