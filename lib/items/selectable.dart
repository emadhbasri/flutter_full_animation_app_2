import 'package:flutter/material.dart';

import '../data.dart';

class SelectableScale extends StatefulWidget {
  const SelectableScale({Key? key, required this.child, this.onTap,
    this.reverse=false,
    this.endScale=1.15, this.startScale=0.85, this.duration=mil300}) : super(key: key);
  final Widget child;
  final Function? onTap;
  final double endScale;
  final bool reverse;
  final double startScale;
  final Duration duration;
  @override
  _SelectableScaleState createState() => _SelectableScaleState();
}

class _SelectableScaleState extends State<SelectableScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,value: 0.5,
        duration: widget.duration,reverseDuration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.reverse){
          _controller.forward()
              .then((value) => _controller.reverse()
              .then((value) => _controller.animateTo(0.5,duration: widget.duration)
              .then((value) {
            if(widget.onTap!=null){
              widget.onTap!();
            }
          })));
        }else{
          _controller.reverse()
              .then((value) => _controller.forward()
              .then((value) => _controller.animateTo(0.5,duration: widget.duration)
              .then((value) {
            if(widget.onTap!=null){
              widget.onTap!();
            }
          })));
        }


          },
      child: ScaleTransition(
        scale: Tween<double>(begin: widget.startScale,end: widget.endScale).animate(_controller),
        child: widget.child,
        alignment: Alignment.center,
      ),
    );
  }
}
