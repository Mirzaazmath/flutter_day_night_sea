import 'package:flutter/material.dart';
class AnimatedBorder extends StatefulWidget {
  Widget child;
  AnimatedBorder({required this.child});


  @override
  State<AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<AnimatedBorder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller..duration=Duration(seconds: 1);
    _controller
      ..forward()
    ..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _controller.forward(from: 0);
      }
    })..addListener(() {
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(10),
      // height: 60,
      // width: 150,
      decoration:  BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1,1),
            blurRadius: 3
          ),

        ],
        gradient: SweepGradient(
          startAngle: 4,
            transform: GradientRotation(_controller.value*6),
            colors: const [
          Colors.black,Colors.blue
        ])

      ),
      child: widget.child,
    );
  }
}
