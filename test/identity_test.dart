import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('Student details in your private activity copy', () {
    late Map<String, dynamic> info;
    setUpAll(() {
      info = jsonDecode(File('student.json').readAsStringSync()) as Map<String, dynamic>;
    });
    for (final field in ['fullName', 'studentNumber', 'studentEmail', 'classCode', 'githubAccount', 'room', 'pcNumber']) {
      test('$field is filled in', () {
        final value = info[field];
        expect(value, isA<String>(), reason: 'Set $field in student.json.');
        expect((value as String).trim(), isNotEmpty, reason: 'Set $field in your private copy of student.json.');
      });
    }
    test('classCode identifies one of the new ADET classes', () {
      expect(info['classCode'], isIn(['2223', '2293', '2182', '2294']), reason: 'Use the class code shown in your own Canvas course.');
    });
  });
}
