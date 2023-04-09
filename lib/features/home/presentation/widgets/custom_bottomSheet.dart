import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moexfilm/config/app_color.dart';
import 'dart:math' as math;

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({super.key, required this.child, this.bottomNavigationBar});

  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

  double get maxWidth => MediaQuery.of(context).size.width;

  bool get isCompleted => _controller.status == AnimationStatus.completed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) {
    return lerpDouble(min, max, _controller.value);
  }

  void toggle() {
    _controller.fling(velocity: isCompleted ? -1 : 1);
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  void verticalDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0) {
      _controller.fling(velocity: math.max(1, -flingVelocity));
    } else if (flingVelocity > 0) {
      _controller.fling(velocity: math.min(-1, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -1 : 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: lerp(maxHeight / 1.7, maxHeight),
              child: GestureDetector(
                onTap: toggle,
                onVerticalDragUpdate: verticalDragUpdate,
                onVerticalDragEnd: verticalDragEnd,
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.ACCENT_COLOR,
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      color: AppColors.BACKGROUND_COLOR),
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                        child:AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            child: isCompleted
                                ? widget.bottomNavigationBar
                                : const SizedBox())),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 85,
                          height: 6,
                          decoration: BoxDecoration(
                            color: AppColors.ACCENT_COLOR,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        widget.child
                      ],
                    )
                  ]),
                ),
              ));
        });
  }
}
