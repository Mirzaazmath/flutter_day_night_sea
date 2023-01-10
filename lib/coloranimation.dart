import 'package:flutter/material.dart';
class ColorContainer extends StatefulWidget {
  Widget child;
  ColorContainer({required this.child});


  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?>_coloranimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 10))..repeat(reverse: true);
    _coloranimation=ColorTween(begin:Colors.lightBlueAccent,end: Colors.black).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (_,child){
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: _coloranimation.value,
        child:widget.child ,

      );
    });
  }
}
