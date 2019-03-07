import 'dart:async';

import 'package:flutter/material.dart';

class SlideUpdate {
  final updateType;
  final direction;
  final slidePercent;

  SlideUpdate(this.updateType, this.direction, this.slidePercent);

  @override
  String toString() => "$updateType-$direction-$slidePercent";
}

enum TransitionGoal {
  open,
  close,
}

enum UpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PageDragger extends StatefulWidget {
//  final canDragLeftToRight;
//  final canDragRightToLeft;

  final StreamController<SlideUpdate> slideUpdateStream;

  PageDragger({
//    this.canDragLeftToRight,
//    this.canDragRightToLeft,
    this.slideUpdateStream,
  });

  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const FULL_TRANSTITION_PX = 300.0;

  Offset dragStart;
  SlideDirection direction;
  double slidePercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragEnd: onDragEnd,
      onHorizontalDragUpdate: onDragUpdate,
    );
  }

  void onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  void onDragEnd(DragEndDetails details) {
    widget.slideUpdateStream.add(new SlideUpdate(
      UpdateType.doneDragging,
      SlideDirection.none,
      0.0,
    ));

    dragStart = null;
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (dragStart == null) return;

    final newPosition = details.globalPosition;
    final dx = dragStart.dx - newPosition.dx;
    direction =
        dx > 0 ? SlideDirection.rightToLeft : SlideDirection.leftToRight;
    if (direction != SlideDirection.none) {
      slidePercent = (dx / FULL_TRANSTITION_PX).abs().clamp(0.0, 1.0);
    } else {
      slidePercent = 0.0;
    }

    final event = SlideUpdate(UpdateType.dragging, direction, slidePercent);
    widget.slideUpdateStream.add(event);
  }
}
