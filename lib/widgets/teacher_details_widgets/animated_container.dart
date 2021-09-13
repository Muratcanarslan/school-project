import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolproject/models/teacher_details_model.dart';
import 'package:schoolproject/routes/routes.dart';

class AnimatedBottomContainer extends StatefulWidget {
  final ScrollController controller;
  final TeacherDetailsModel model;

  AnimatedBottomContainer({
    required this.controller,
    required this.model,
  });
  @override
  _AnimatedBottomContainerState createState() =>
      _AnimatedBottomContainerState();
}

class _AnimatedBottomContainerState extends State<AnimatedBottomContainer> {
  bool fab = true;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          fab = true;
        });
      } else if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          fab = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linear,
      height: fab == true ? MediaQuery.of(context).size.height * 0.1 : 0,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.black26,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$ 20+",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "/Hour",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(fontSize: 17),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.lessonType,
                    arguments: widget.model,
                  );
                },
                child: Text(
                  "Book Now",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
