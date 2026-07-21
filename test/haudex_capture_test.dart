// m4a2 - screenshot capture (teacher-canonical, NOT scored).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m4a2_monster_card/monster.dart';
import 'package:m4a2_monster_card/monster_card.dart';

import 'support/haudex_golden.dart';

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: monster card', (tester) async {
    const monster = Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40);
    await captureScreen(
      tester,
      Scaffold(
        appBar: AppBar(title: const Text('HAUDEX')),
        body: const Center(child: MonsterCard(monster: monster)),
      ),
      name: 'card',
    );
  });
}
