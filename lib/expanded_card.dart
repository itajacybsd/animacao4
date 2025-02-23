// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

//! usando SizeTransition indicado pela madô

class ExpandedCard extends StatefulWidget {
  bool isOpen;
  String title;
  String text;

  // ignore: use_super_parameters
  ExpandedCard({
    Key? key,
    required this.isOpen,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandedCard> createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _angleAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _heightFactorAnimation;
  late Animation<double> _sizeAnimation;

  

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationController.addListener(listener);

    _angleAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(_animationController);

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.blueAccent,
    ).animate(_animationController);

    _heightFactorAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.removeListener(listener);
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.isOpen) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.isOpen = !widget.isOpen;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, color: _colorAnimation.value),
                  ),
                ),
                Transform.rotate(
                  angle: _angleAnimation.value,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: _colorAnimation.value,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          heightFactor: _heightFactorAnimation.value,
          alignment: Alignment.centerLeft,
          child: SizeTransition(
            sizeFactor: _sizeAnimation,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  color: _colorAnimation.value,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
