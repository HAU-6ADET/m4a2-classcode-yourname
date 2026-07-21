// m4a2 - Monster Card: behaviour checks (canonical, overlaid onto each clone).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m4a2_monster_card/monster.dart';
import 'package:m4a2_monster_card/monster_card.dart';

const sample = Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40);

Future<void> pumpCard(WidgetTester tester, [Monster m = sample]) async {
  await tester.pumpWidget(
    MaterialApp(home: Scaffold(body: Center(child: MonsterCard(monster: m)))),
  );
}

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('MonsterCard', () {
    testWidgets('is built on a Card', (tester) async {
      await pumpCard(tester);
      expect(find.byType(Card), findsOneWidget,
          reason: 'Wrap the card content in a Card widget.');
    });

    testWidgets('shows the monster name in a Text keyed "name"', (tester) async {
      await pumpCard(tester);
      final f = find.byKey(const Key('name'));
      expect(f, findsOneWidget,
          reason: 'Add a Text with key Key(\'name\').');
      expect(tester.widget<Text>(f).data, 'Emberling');
    });

    testWidgets('shows the type in a Text keyed "type"', (tester) async {
      await pumpCard(tester);
      final f = find.byKey(const Key('type'));
      expect(f, findsOneWidget,
          reason: 'Add a Text with key Key(\'type\').');
      expect((tester.widget<Text>(f).data ?? '').toLowerCase(), contains('fire'));
    });

    testWidgets('shows HP as current / max in a Text keyed "hp"', (tester) async {
      await pumpCard(tester);
      final f = find.byKey(const Key('hp'));
      expect(f, findsOneWidget,
          reason: 'Add a Text with key Key(\'hp\').');
      final hp = tester.widget<Text>(f).data ?? '';
      expect(hp, contains('30'), reason: 'Show the current HP.');
      expect(hp, contains('40'), reason: 'Show the max HP.');
    });

    testWidgets('lays the card out with a Column and a Row', (tester) async {
      await pumpCard(tester);
      expect(find.byType(Column), findsWidgets,
          reason: 'Stack the card content vertically with a Column.');
      expect(find.byType(Row), findsWidgets,
          reason: 'Put at least one row (e.g. name and type) in a Row.');
    });

    testWidgets('reflects a different monster (no hard-coded values)',
        (tester) async {
      await pumpCard(
          tester, const Monster(name: 'Sprout', type: 'grass', hp: 12, maxHp: 20));
      expect(tester.widget<Text>(find.byKey(const Key('name'))).data, 'Sprout');
      expect(tester.widget<Text>(find.byKey(const Key('hp'))).data, contains('12'));
    });
  });
}
