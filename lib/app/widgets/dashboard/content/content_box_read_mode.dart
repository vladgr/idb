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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: this.item.contentHtml,
        style: {
          'body': Style(
            fontSize: FontSize(L.v(13)),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.black87,
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
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            border: Border(
              bottom: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
              top: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
              left: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
              right: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
            ),
          ),
          'code': Style(
            fontFamily: 'Inconsolata',
            fontSize: FontSize(L.v(14)),
            color: Config.primaryColor,
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
      ),
    );
  }
}
