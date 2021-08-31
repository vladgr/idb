import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/logger_service.dart';

// Image that automatically can get width and height from src.
// It should have correct naming: <prefix>_<width>x<height>.png
class SmartImage extends StatelessWidget {
  final String src;
  const SmartImage({Key? key, required this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logger = GetIt.I<LoggerService>();
    var re = RegExp(r'_(\d+)x(\d+)\.');

    var l = re.allMatches(this.src).toList();
    if (l.length != 1) logger.debug(this.src);
    assert(l.length == 1);

    var m = l.first;
    var width = int.parse(m.group(1)!).toDouble();
    var height = int.parse(m.group(2)!).toDouble();

    return Image(
      image: AssetImage(this.src),
      width: L.v(width),
      height: L.v(height),
    );
  }
}
