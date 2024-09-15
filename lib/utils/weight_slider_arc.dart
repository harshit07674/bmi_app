import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/rendering.dart';

class WeightSliderArcPainter extends CustomPainter {

  WeightSliderArcPainter(this.offset) : super(repaint: offset);

  final ViewportOffset offset;

  @override
  void paint(Canvas canvas, Size size) {

    

    final value = offset.pixels;
    final paint = Paint()..color=AppColors.topHeadingColor..strokeWidth=2;

    final width2 = size.width / 2;
    final height2 = size.height;
    final style = TextStyle(
      color: AppColors.labelTextColor,
      fontWeight: FontWeight.w300,
      fontSize: height2 / 2,
    );
    final points = <(double, double, double)>[];
    final labels = <double, String>{};
    for (int i = 0; i <=10 *15; i++) {
      final x = width2 + i * size.width / 20;
      final pad = size.width/ 4;
      if (value - pad <= x && x <= value + size.width + pad) {
        double y = height2 * 0.666;
        if (i % 5 == 0) {
          y = height2 * 1.2;
          labels[x] = (150-i).toString();
        }
        points.add((x, y, height2));
      }
    }
    // print(points.length);
    final anchor = Offset(0, size.width);
    for (final line in points) {
      final x = line.$1;
      final matrix = composeMatrix(
        translate: anchor.translate(width2, 0),
        rotation: (x - value - width2) / size.width*2,
        anchor: anchor,
      );
      canvas
        ..save()
        ..transform(matrix.storage)
        ..drawLine(Offset(0, line.$2+10), Offset(0, line.$3-20), paint,);
        
      if (labels[x] != null) {
        _paintLabel(labels[x]!, canvas, style);
      }
      canvas.restore();
    }

    // final p1 = size.topCenter(Offset.zero);
    // final p2 = size.bottomCenter(Offset.zero);
    // canvas.drawLine(p1, p2, paint..color = Colors.black38);
  }

  @override
  bool shouldRepaint(WeightSliderArcPainter oldDelegate) => false;

  _paintLabel(String label, Canvas canvas, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: label, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter
      ..layout()
      ..paint(canvas, Offset(-textPainter.width / 2, -7));
  }

}

Matrix4 composeMatrix({
  double scale = 1,
  double rotation = 0,
  Offset translate = Offset.zero,
  Offset anchor =const Offset(0, 0),
}) {
  final double c = cos(rotation) * scale;
  final double s = sin(rotation) * scale;
  final double dx = translate.dx - c * anchor.dx + s* anchor.dy;
  final double dy = translate.dy - s * anchor.dx - c * anchor.dy;
  return Matrix4(c, s, 0, 0, -s, c, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
}