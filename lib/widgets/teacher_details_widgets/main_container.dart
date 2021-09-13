import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 0.2,
            spreadRadius: 0.2,
            color: Colors.black26,
          )
        ],
      ),
      child: child,
    );
  }
}
