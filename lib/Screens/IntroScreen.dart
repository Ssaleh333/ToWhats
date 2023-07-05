
import 'dart:async';

import 'package:aaa/Screens/Home.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const color = const Color(0xFFC8E6C9);
  static const color2 = const Color(0xFF43A047);

  @override
  void initState(){
    super.initState();
 Timer(Duration(seconds: 4),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
             color,
              color2
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(

              children: [
                Image.asset("assets/images/ss.png",height: 200,width: 230,),
                SizedBox(
                  height: 25,
                ),
                Text('Lets go to send message',style: TextStyle(color: Colors.white,fontSize: 14),),
                SizedBox(height: 3,),
                Text('ToWhatsapp',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 35,),
                ColorfulCircularProgressIndicator(
                  colors: [Colors.green, Colors.greenAccent, color, color2],
                  strokeWidth: 4,
                  indicatorHeight: 45,
                  indicatorWidth: 45
                ),

              ],
            ),
         SizedBox(height: 120,),
         Column(
           children: [
             Text('@by sara soliman',textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 10,),)
           ],
         )
          ],
        )

      )
    );
  }
}
