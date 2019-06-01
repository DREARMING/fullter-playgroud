import 'package:flutter/material.dart';
import 'dart:math';

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatelessColorfulTile(),
      StatelessColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Row(children: tiles)),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles));
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final Color color = UniqueColorGenaretor.getColor();

  StatelessColorfulTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => buildColorfulTile(color);
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = UniqueColorGenaretor.getColor();
  }

  @override
  Widget build(BuildContext context) => buildColorfulTile(color);
}

class UniqueColorGenaretor {
  static List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.teal,
    Colors.purpleAccent
  ];
  static Random random = Random();

  static Color getColor() {
    final i = random.nextInt(colors.length);
    return colors[i];
  }
}

Widget buildColorfulTile(Color color) =>
    Container(width: 60, height: 60, color: color);
