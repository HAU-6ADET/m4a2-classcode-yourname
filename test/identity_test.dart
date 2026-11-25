import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('Student details in your private activity copy', () {
    test('student.json is filled in with text, and the class code is one of the new ADET classes', () {
      final info = jsonDecode(File('student.json').readAsStringSync()) as Map<String, dynamic>;
      for (final field in ['fullName', 'studentNumber', 'studentEmail', 'classCode', 'githubAccount', 'room', 'pcNumber']) {
        final value = info[field];
        expect(value, isA<String>(), reason: 'Set $field in student.json as text.');
        expect((value as String).trim(), isNotEmpty, reason: 'Set $field in your private copy of student.json.');
      }
      expect(info['classCode'], isIn(['2223', '2293', '2182', '2294']), reason: 'Use the class code shown in your own Canvas course.');
    });
  });
}
