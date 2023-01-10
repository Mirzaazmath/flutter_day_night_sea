import 'package:flutter/material.dart';
class SlideAnimateWidget extends StatefulWidget {
  Widget child;
  SlideAnimateWidget({required this.child});


  @override
  State<SlideAnimateWidget> createState() => _SlideAnimateWidgetState();
}

class _SlideAnimateWidgetState extends State<SlideAnimateWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset>_verticalanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 10))..repeat(reverse: true);
    _verticalanimation=Tween(begin: Offset.zero,end: Offset(0.1,0.9)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return SlideTransition(position: _verticalanimation,
      child: widget.child,

    );
  }
}
