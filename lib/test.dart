import 'package:firstapp_fiftychanllenge/app/my_app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void updateState(){
    MyApp.instance.appState++;
  }

  void getState(){
      print( MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Center(
        child: Container(
          child: OutlinedButton(onPressed: (){updateState(); getState();}, child: Text("A"),),
        ),
      )
    );
  }
}
