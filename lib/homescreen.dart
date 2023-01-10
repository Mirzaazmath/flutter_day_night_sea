import 'package:animated_border/slideanimation.dart';
import 'package:flutter/material.dart';

import 'animatedborderwidget.dart';
import 'coloranimation.dart';
import 'horizontalslide.dart';
import 'mooncolor.dart';
import 'moonslide.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBorder(child: Stack(
        children: [
          ColorContainer(


            child: SlideAnimateWidget(child:
           const  Padding(
              padding:  EdgeInsets.all(30),
              child: CircleAvatar(
                backgroundColor: Colors.orange,
              ),
            )),

          ),
          MoonColors(

          ),

          Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HorizontalSlide(
                child: Container(
                  height: 50,

                  child:Image.asset("assets/ship.png") ,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,width: 200,color: Colors.blueAccent,),
                  ),

                ],
              ),
            ],
          )
        ],
      ),
      ),
    );
  }
}
