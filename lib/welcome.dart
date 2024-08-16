import 'package:climate_app/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(

            children: [
              SizedBox(
                height: 100,
              ),
              Text("Discover The",style:GoogleFonts.lobster(
                fontSize: 40,fontWeight: FontWeight.bold,color:Colors.black,


              ),),
              Text("Weather In Your City",style:GoogleFonts.lobster(
                fontSize: 40,fontWeight: FontWeight.bold,color:Colors.black,
              ),),

              SizedBox(
                height: 70,
              ),

              Image.asset("Assetss/blackcloud.png"),

              SizedBox(
                height: 70,
              ),

              Text("Get to know your weather maps and",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,
              ),),
              Text("radar precipitation forecast",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,),),

              SizedBox(
                height: 50,
              ),

              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return First();

                  }));
                },

                child: Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    padding: EdgeInsets.all(15),

                    child: Text("Get Started",style: TextStyle(
                        fontWeight: FontWeight.bold,color: CupertinoColors.white,fontSize: 20
                    ),textAlign: TextAlign.center,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [Colors.yellow,Colors.orangeAccent]),
                    )

                ),
              ),



            ],



          ),)
    );
  }}