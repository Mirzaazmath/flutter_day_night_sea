import 'package:flutter/material.dart';

import 'moonslide.dart';
class MoonColors extends StatefulWidget {



  @override
  State<MoonColors> createState() => _MoonColorsState();
}

class _MoonColorsState extends State<MoonColors> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?>_coloranimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 10))..repeat(reverse: true);
    _coloranimation=ColorTween(begin:Colors.lightBlueAccent,end: Colors.white).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (_,child){
      return MoonSlideup(
        child:  Container(
            height: 100,
            width:100,
            decoration:  BoxDecoration(

                shape: BoxShape.circle,
                color: _coloranimation.value,
                boxShadow:  [
                  BoxShadow(
                      color: _coloranimation.value as Color,
                      blurRadius: 30,


                      blurStyle: BlurStyle.outer

                  )])),
      );
    });
  }
}
