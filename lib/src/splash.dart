import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  AudioPlayer player = AudioPlayer();
  String audioasset = "assets/audio/shrot_1.MP3";

  @override
  initState() {
    playAudio();
    Future.delayed(Duration(seconds: splashtime), () async {
      player.stop();
      Navigator.of(context).pushNamed('/menu');
    }); 
    super.initState();
  }
  
  playAudio()async{
    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    Uint8List  soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    if(result == 1){ //play success
        if (kDebugMode) {
          print("Sound playing successful.");
        }
    }else{
        if (kDebugMode) {
          print("Error while playing sound.");
        } 
    }
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