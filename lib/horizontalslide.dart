import 'package:flutter/material.dart';
class HorizontalSlide extends StatefulWidget {
  Widget child;
  HorizontalSlide({required this.child});


  @override
  State<HorizontalSlide> createState() => _HorizontalSlideState();
}

class _HorizontalSlideState extends State<HorizontalSlide> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset>_horizontalslide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration:const  Duration(seconds: 10))..repeat(reverse: true);
    _horizontalslide=Tween(  begin: const Offset(1.0, 0.0),
      end: Offset.zero,).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _horizontalslide,
        child: widget.child);
  }
}
