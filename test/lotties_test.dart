import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/resources/resources.dart';

void main() {
  test('lotties assets test', () {
    expect(File(Lotties.snakeMovingConfetti).existsSync(), true);
  });
}
