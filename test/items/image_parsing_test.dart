import 'package:flutter_test/flutter_test.dart';
import 'package:idb/app/config.dart';

import '../test_service.dart';

void main() {
  final ts = TestService();

  String data = '''
  something
  [img:some-path1/some-file1.jpg]
  something
  [img:some-path2/some-file2.jpg]
  something
  ''';

  test('Test parsing image', () async {
    await ts.init();

    final re = RegExp(r'\[img:(.*?)\]', dotAll: true);

    data = data.replaceAllMapped(re, (m) {
      final imgPath = '${m.group(1)}';
      return '<img src="${Config.bucketUrl}/$imgPath" />';
    });

    // ignore: avoid_print
    print(data);
  });
}
