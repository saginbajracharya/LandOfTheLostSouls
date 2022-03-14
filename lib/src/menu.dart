import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

import 'styles.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({ Key? key }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: const [
                    SizedBox(
                      height: kBottomNavigationBarHeight+50,
                    ),
                    Text(
                      "Land Of The Lost Souls", 
                      style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/levelSelect');
                      }, 
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/settings');
                      }, 
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Exit',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: (){
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      }, 
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}