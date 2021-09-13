import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedHeart extends StatefulWidget {
  AnimatedHeart({
    required this.isFav,
    required this.size,
  });

  bool isFav;
  final double size;

  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  bool isForward = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimationTrue;
  late Animation<double> _sizeAnimation;
  late Animation _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    if (widget.isFav == false) {
      _colorAnimationTrue = ColorTween(begin: Colors.grey[400], end: Colors.red)
          .animate(_curveAnimation as Animation<double>);
    } else {
      _colorAnimationTrue = ColorTween(begin: Colors.red, end: Colors.grey[400])
          .animate(_curveAnimation as Animation<double>);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          widget.isFav = false;
          isForward = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          widget.isFav = true;
          isForward = false;
        });
      }
    });

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween(begin: widget.size, end: widget.size + 15),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween(begin: widget.size + 15, end: widget.size),
          weight: 50,
        ),
      ],
    ).animate(_curveAnimation as Animation<double>);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          onPressed: () {
            isForward == false ? _controller.forward() : _controller.reverse();
          },
          icon: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _colorAnimationTrue.value,
          ),
        );
      },
    );
  }
}
