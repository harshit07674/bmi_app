import 'package:flutter/material.dart';
import 'package:bmi/utils/weight_slider_arc.dart'; 


class SizedContentScrollable extends StatefulWidget {

   SizedContentScrollable({
    super.key,
    required this.viewportBuilder,
    required this.contentSize,
    this.scrollDirection = Axis.vertical,
    this.physics,
  });

  /// Builds the viewport through which the scrollable content is displayed.
  /// See [Scrollable.viewportBuilder] for more info.
  final ViewportBuilder viewportBuilder;

  /// Called to return the content size along the [scrollDirection].
  final double Function(double viewportSize) contentSize;

  /// {@macro flutter.widgets.scroll_view.scrollDirection}
  final Axis scrollDirection;

  final ScrollPhysics? physics;

  @override
  State<SizedContentScrollable> createState() => _SizedContentScrollableState();
}

class _SizedContentScrollableState extends State<SizedContentScrollable> {
 ScrollController scroller = ScrollController();
 double range = 35.0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: Scrollable(
        axisDirection: widget.scrollDirection == Axis.vertical? AxisDirection.down : AxisDirection.right,
        physics: widget.physics,
        viewportBuilder: (context, offset) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // print(constraints);
              final size = widget.scrollDirection == Axis.vertical? constraints.maxHeight : constraints.maxWidth;
              offset
                ..applyViewportDimension(size)
                ..applyContentDimensions(0, widget.contentSize(size) - size);
              return widget.viewportBuilder(context, offset);
            }
          );
        },
       controller: scroller,
       
      ),
      onNotification: (ScrollNotification notifiction){
        setState(() {

               print(((scroller.position.pixels-1000)/20)+50);                            
     
        });
        return true;
      },
    );
  }
}

class WeightSlider extends StatefulWidget {

  @override
  State<WeightSlider> createState() => WeightSliderState();
}

class WeightSliderState extends State<WeightSlider> with TickerProviderStateMixin {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 5,
          child: SizedContentScrollable(
            contentSize: (size) => size * 6,
            scrollDirection: Axis.horizontal,
            viewportBuilder: (context, offset) {
              // print(isScrolling);
              return CustomPaint(
                painter: WeightSliderArcPainter(offset),
                child: const SizedBox.expand(),
              );
            },
          ),
        ),
      ),
    );
  }
}



