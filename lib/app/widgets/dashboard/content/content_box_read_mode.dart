// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';
import 'package:html/parser.dart';
import 'package:idb/app/config.dart';
import 'package:idb/app/models/item.dart';
import 'package:idb/app/services/l.dart';
import 'package:idb/app/services/scaffold_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
      onAnchorTap: (url, _, __) {
        if (url != null) launchUrl(Uri.parse(url));
      },
      data: htmlString,
      style: {
        'body': Style(
          fontSize: FontSize(L.v(13)),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          padding: HtmlPaddings.all(0),
          margin: Margins.all(0),
        ),
        'code': Style(
          backgroundColor: _backgroundColor,
          fontFamily: 'Inconsolata',
          fontSize: FontSize(L.v(14)),
          color: Config.primaryColor,
        ),
        'pre': Style(
          padding: HtmlPaddings.only(
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
          color: Config.primaryColor,
        ),
        'p': Style(
          margin: Margins.all(L.v(5)),
        ),
        'img.item-image': Style(
          display: Display.inline,
        ),
      },
    );
  }

  /// When block started with "<pre>"
  /// wrap in Stack and make it possible to copy to clipboard
  Widget _wBlock(String htmlString) {
    final _scaffold = GetIt.I<ScaffoldService>();

    // Code blocks that can be copied to clipboard
    if (htmlString.startsWith('<pre>')) {
      return Stack(
        children: [
          _wHtml(htmlString),
          Positioned(
            top: L.v(10),
            right: L.v(5),
            child: IconButton(
              onPressed: () async {
                final el = parse(htmlString);
                String? s = el.body?.firstChild?.text;
                if (s != null) {
                  await FlutterClipboard.copy(s);
                  _scaffold.createAlert('Copied');
                }
              },
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
      children: item.htmlParts.map((s) => _wBlock(s)).toList(),
    );
  }
}
