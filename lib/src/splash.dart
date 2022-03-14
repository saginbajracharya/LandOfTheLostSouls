import 'package:flutter/material.dart';
import 'package:land_of_the_lost_souls/src/styles.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  int splashtime = 3; 
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.of(context).pushNamed('/menu');
    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body:Container(
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //vertically align center
          children:<Widget>[
            Container(
              margin: const EdgeInsets.only(top:30),
              //margin top 30
              child: const Text(
                "Land Of The Lost Souls", 
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30,
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:15),
              child: const Text(
                "Version: 1.0.0", 
                style:TextStyle(
                  color:Colors.white,
                  fontSize: 20,
                )
              ),
            ),
          ]
        )
      )  
    );
  }
}