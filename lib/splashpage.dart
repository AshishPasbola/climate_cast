import 'dart:async';

import 'package:climate_app/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {


  @override
  void initState() {
    Timer(Duration(seconds: 7), ()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
      {
        return Welcome();
      }));

    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                height: 200,
                width:300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("Assetss/blackcloud.png")
                    )
                ),

              )

          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 4),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child: Text(
                  "ClimateCast",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40 * value,


                  ),),
              );
            },
          ),],
      ),);
  }}


