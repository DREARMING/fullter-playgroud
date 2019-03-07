import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/dragger/page_drager.dart';

class PageDraggerWidget extends StatefulWidget {
  @override
  State createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDraggerWidget> {
  double percent = 0.2;
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
    final fontSize = (100 * percent).roundToDouble();
    return Stack(
      children: <Widget>[
        Container(
            constraints: BoxConstraints(),
            child: Center(
              child: Text("$fontSize", style: TextStyle(fontSize: fontSize)),
            )),
        PageDragger(slideUpdateStream: this.slideUpdateStream)
      ],
    );
  }
}
