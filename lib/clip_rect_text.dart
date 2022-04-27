import 'package:auto_size_text/auto_size_text.dart';
import 'package:badminton/flutter_utils.dart';
import 'package:flutter/material.dart';

class ClipRectText extends StatefulWidget {
  int value;
  Alignment alignment;

  ClipRectText({Key? key, required this.value, required this.alignment})
      : super(key: key);

  @override
  _ClipRectTextState createState() {
    return _ClipRectTextState();
  }
}

class _ClipRectTextState extends State<ClipRectText>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRect(
      child: Align(
        alignment: widget.alignment,
        heightFactor: 0.5,
        child: Container(
          alignment: Alignment.center,
          width: Responsive.getWidth(context) / 2 - 50,
          height: Responsive.getHeight(context) / 2 - 50,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: AutoSizeText(
            '${widget.value}',
            maxFontSize: double.infinity,
            minFontSize: 12,
            maxLines: 1,
            style: const TextStyle(fontSize: 1000, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
