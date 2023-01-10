import 'package:flutter/material.dart';
class MoonSlideup extends StatefulWidget {
  Widget child;
  MoonSlideup({required this.child});


  @override
  State<MoonSlideup> createState() => _MoonSlideupState();
}

class _MoonSlideupState extends State<MoonSlideup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset>_verticalanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 10))..repeat(reverse: true);
    _verticalanimation=Tween(begin: Offset.zero,end: Offset(1.1,4.9)).animate(_controller);
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
