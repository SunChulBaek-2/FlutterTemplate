import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.kubaInformationIconsSet1).existsSync(), true);
  });
}
