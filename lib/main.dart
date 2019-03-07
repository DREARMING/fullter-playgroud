import 'package:flutter/material.dart';
import 'package:flutter_playground/widget/wave_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(10);

    return Center(
      child: ListView(
        children: <Widget>[
          Padding(padding: padding, child: WaveCard(Colors.grey)),
          Padding(padding: padding, child: WaveCard(Colors.lightGreen)),
          Padding(padding: padding, child: WaveCard(Colors.green)),
          Padding(padding: padding, child: WaveCard(Colors.blue)),
        ],
      ),
    );
  }
}
