import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_playground/widget/dragger/page_drager.dart';

class PageDraggerWidget extends StatefulWidget {
  @override
  State createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDraggerWidget> {
  double percent = 0.0;
  StreamController<SlideUpdate> slideUpdateStream;

  void onStreamData(SlideUpdate slideUpdate) {
    if (mounted) {
      if (slideUpdate.updateType == UpdateType.dragging) {
        setState(() {
          print(slideUpdate);
          percent = slideUpdate.slidePercent;
        });
      }
    }
  }

  _PageDraggerState() {
    slideUpdateStream = StreamController<SlideUpdate>()
      ..stream.listen(this.onStreamData);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(width: percent * w, height: percent * h, color: Colors.teal),
        Center(child: Text("Touch and dragger")),
        PageDragger(slideUpdateStream: this.slideUpdateStream)
      ],
    );
  }
}
