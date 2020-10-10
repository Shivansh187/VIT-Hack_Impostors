import 'package:flutter/material.dart';

class WidgetToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const WidgetToImage({Key key, this.builder}) : super(key: key);
  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}
