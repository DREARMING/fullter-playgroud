import 'package:flutter/widgets.dart';

class WaveCard extends StatelessWidget {
  final Color color;

  WaveCard(this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final painter = WavePainter(color);
    return CustomPaint(
      painter: painter,
      size: Size(500, 200),
    );
  }
}

class WavePainter extends CustomPainter {

  final Color primaryColor;
  final List<Color> colors = List(4);
  final List<int> radius = const [10, 30, 55, 65];
  final List<double> opacity = const [0.3, 0.5, 0.6, 1];

  WavePainter(this.primaryColor) {
    for (int i = 0; i < 4; i++) {
      colors[i] = (Color.fromRGBO(primaryColor.red, primaryColor.green,
          primaryColor.blue, primaryColor.opacity + i * 0.1));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(
          primaryColor.red, primaryColor.green, primaryColor.blue, 1)
      ..blendMode = BlendMode.hardLight
      ..isAntiAlias = true;

    final rect =
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(10.0));
    canvas.drawRRect(rect, paint);
    canvas.clipRRect(rect);

    final radius = (size.width > size.height ? size.height : size.width) / 1.5;
    final ox = size.width - 40;
    final oy = size.height / 2;
    final o = Offset(ox, oy);

    for (int i = 0; i < 4; i++) {
      final c = this.colors[i];
      final r = this.radius[i];
      paint.color = Color.fromRGBO(c.red, c.green, c.blue, opacity[i]);
      canvas.drawCircle(o, radius - r, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}
