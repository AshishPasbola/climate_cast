import 'package:climate_app/api_services/weather_services.dart';
import 'package:climate_app/convertdata.dart';
import 'package:climate_app/model/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {

  Weather? weather;
  String formattedSunriseDate="0";
  @override
  Widget build(BuildContext context) {


    var mQuery=MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(

              children: [
                SizedBox(
                  height: 50,
                ),

                Container(


                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(color: Colors.white,),


                    onSubmitted: (value) async {
                      weather=await WeatherServices().fetchWeather(value);
                      DateTime date=  DateTime.fromMillisecondsSinceEpoch((weather?.sys.sunset??0)*1000);
                      formattedSunriseDate = DateFormat('h:mm a').format(date);
                      setState(() {

                      });
                    },

                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),

                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText:'Search Location',suffixIcon: Icon(Icons.search),


                    ),
                  ),
                ),
                SizedBox(
                  height: 25,

                ),

                Text("${weather?.name??"Enter Your City"}",style: TextStyle(
                  fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,

                ),),

                SizedBox(height:20,),

                Text("${weather?.main.temp==null?0:Convertdata.kelvinToCelsius(weather!.main.temp).round()} °C",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 100,color: Colors.white,
                ),),

                Text("${weather?.weather[0].main??""}",style: TextStyle(
                  fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white,),),


                Image.asset("Assetss/cloud33.png"),

                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(20),
                    height: 150,
                    width: 350,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: mQuery.size.width*0.20,
                          height: mQuery.size.height*0.15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8)

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("Assetss/humidity.svg", height: 25,
                                width: 30,),
                              Text("${weather?.main.humidity ?? 0} %",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("Humidity",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          width: mQuery.size.width * 0.22,
                          height: mQuery.size.height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8)


                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "Assetss/windd.svg", height: 25, width: 30,),

                              Text("${weather?.wind.speed ?? 0
                              } ",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("Wind Speed",style: TextStyle(

                                  color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),

                        Container(
                          width: mQuery.size.width * 0.22,
                          height: mQuery.size.height * 0.15,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8)


                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "Assetss/sunsett.svg", height: 25, width: 30,),

                              Text("${ formattedSunriseDate} ",style: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.bold),),
                              Text("Sunset",style: TextStyle(

                                  color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),


                      ],
                    )


                ),
              ]
          ),
        )
    );





  }
}

