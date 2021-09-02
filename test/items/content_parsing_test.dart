import 'package:flutter_test/flutter_test.dart';

import '../test_service.dart';

void main() {
  final _ts = TestService();

  String data = """
    anything1
    <pre><code>
    some1
    </code></pre>
    anything2
    <pre><code>
    some2
    </code></pre>
    anything3
  """;

  // Consider feature feature to split by blocks and copy paste each block
  test('Test parsing', () async {
    await _ts.init();

    final re = RegExp(
      r'(.*?)(<pre>\s*<code>.*?</code>\s*</pre>)',
      dotAll: true,
    );

    for (var m in re.allMatches(data)) {
      print(m.group(1));
      print(m.group(2));
    }
  });
}
