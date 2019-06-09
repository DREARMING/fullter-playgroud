import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

class IntervalProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IntervalProgressBar.demo,
            SizedBox(width: 0, height: 20),
            IntervalProgressBar(
                direction: IntervalProgressDirection.horizontal,
                max: 5,
                progress: 4,
                intervalSize: 2,
                size: Size(double.infinity, 12),
                highlightColor: Colors.black,
                defaultColor: Colors.grey,
                intervalColor: Colors.transparent,
                intervalHighlightColor: Colors.transparent,
                radius: 6),
            SizedBox(width: 0, height: 20),
            IntervalProgressBar(
                direction: IntervalProgressDirection.horizontal,
                max: 15,
                progress: 4,
                intervalSize: 2,
                size: Size(double.infinity, 12),
                highlightColor: Colors.black,
                defaultColor: Colors.grey,
                intervalColor: Colors.transparent,
                intervalHighlightColor: Colors.transparent,
                radius: 6),
            SizedBox(width: 0, height: 20),
            IntervalProgressBar(
                direction: IntervalProgressDirection.horizontal,
                max: 15,
                progress: 15,
                intervalSize: 10,
                size: Size(double.infinity, 12),
                highlightColor: Colors.black,
                defaultColor: Colors.grey,
                intervalColor: Colors.transparent,
                intervalHighlightColor: Colors.grey,
                radius: 0),
            SizedBox(width: 0, height: 20),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      [10, 29, 18, 27, 16, 15, 24, 3, 20, 10].map<Widget>((i) {
                    return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: IntervalProgressBar(
                            direction: IntervalProgressDirection.vertical,
                            max: 30,
                            progress: i,
                            intervalSize: 2,
                            size: Size(12, 200),
                            highlightColor: Colors.red,
                            defaultColor: Colors.grey,
                            intervalColor: Colors.transparent,
                            intervalHighlightColor: Colors.transparent,
                            reverse: true,
                            radius: 0));
                  }).toList()),
            )
          ],
        ));
  }
}
