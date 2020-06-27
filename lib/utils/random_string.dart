import 'dart:convert';
import 'dart:math';

String randomString({int length = 64}) {
  List<int> values =
      List<int>.generate(length, (i) => Random.secure().nextInt(256));

  return base64Url.encode(values);
}
