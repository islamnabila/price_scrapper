
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final String imagePath;

  const AnimatedImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(5, 0), // Start from right
      end: Offset(-5, 0), // Move to left
    ).animate(_controller);

    // Repeat the animation indefinitely
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
