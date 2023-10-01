import 'package:flutter/material.dart';
import 'Splash.dart';
void main(){
  runApp(App());
}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
          theme: ThemeData(
              canvasColor: Colors.grey.shade800
          ),
        debugShowCheckedModeBanner: false,
        home:Splash()
      ),);

  }
}
