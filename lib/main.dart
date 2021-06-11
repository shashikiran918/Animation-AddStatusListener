import "package:flutter/material.dart";

void main()=> runApp(MaterialApp(home: Spinner()));



class Spinner extends StatefulWidget {
@override
_SpinnerState createState() => new _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = new CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed)
        print('completed');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
          return new Transform.rotate(
            angle: _controller.value * 2.0 * 3.1415,
            child: child,
          );
        },
      child: new Container(width: 100.0, height: 100.0, color: Colors.green),
    );
  }
}