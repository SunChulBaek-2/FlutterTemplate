import 'package:flutter/foundation.dart';

abstract class JsonParser<T> {
  JsonParser(this.encodedJson);

  final String encodedJson;

  Future<T> parseInBackground() {
    return compute(parse, encodedJson);
  }

  T parse(String encodedJson) { throw Exception('Not implemented Here'); }
}