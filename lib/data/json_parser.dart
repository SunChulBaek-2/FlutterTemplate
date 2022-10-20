import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

abstract class JsonParser<T> {
  JsonParser(this.encodedJson);

  final String encodedJson;

  Future<T> parseInBackground() {
    return compute(parse, encodedJson);
  }

  T parse(String encodedJson) { throw Exception('Not implemented Here'); }
}

DateTime? dateTimeFromString(String? text) {
  if (text != null) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(text);
  } else {
    return null;
  }
}