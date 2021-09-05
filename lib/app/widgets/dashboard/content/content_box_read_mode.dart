import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/l.dart';

class ContentBoxReadMode extends StatelessWidget {
  final Item item;

  const ContentBoxReadMode({
    Key? key,
    required this.item,
  }) : super(key: key);

  Color get _backgroundColor {
    return Color.fromRGBO(245, 245, 245, 1);
  }

  Color get _borderColor {
    return Color.fromRGBO(227, 227, 227, 1);
  }

  /// Render HTML string with custom styling
  Widget _wHtml(String htmlString) {
    return Html(
      data: htmlString,
      style: {
        'body': Style(
          fontSize: FontSize(L.v(13)),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        'code': Style(
          backgroundColor: _backgroundColor,
          fontFamily: 'Inconsolata',
          fontSize: FontSize(L.v(14)),
          color: Config.primaryColor,
        ),
        'pre': Style(
          padding: EdgeInsets.only(
            top: L.v(10),
            left: L.v(10),
            right: L.v(10),
          ),
          fontSize: FontSize(L.v(14)),
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.65),
          backgroundColor: _backgroundColor,
          border: Border(
            bottom: BorderSide(color: _borderColor),
            top: BorderSide(color: _borderColor),
            left: BorderSide(color: _borderColor),
            right: BorderSide(color: _borderColor),
          ),
        ),
        'pre code': Style(
          fontFamily: 'Inconsolata',
          fontSize: FontSize(L.v(14)),
          color: Colors.black.withOpacity(0.65),
        ),
        'a': Style(
          color: Colors.pink,
        ),
      },
    );
  }

  /// When block started with "<pre>"
  /// wrap in Stack and make it possible to copy to clipboard
  Widget _wBlock(String htmlString) {
    if (htmlString.startsWith('<pre>')) {
      return Stack(
        children: [
          _wHtml(htmlString),
          Positioned(
            top: L.v(10),
            right: L.v(5),
            child: IconButton(
              onPressed: () => {},
              icon: Icon(Icons.copy),
              iconSize: L.v(16),
            ),
          ),
        ],
      );
    }

    return _wHtml(htmlString);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: this.item.htmlParts.map((s) => _wBlock(s)).toList(),
    );
  }
}
