// m4a2 - screenshot capture (teacher-canonical, NOT scored).
//
// The card is a component, so one shot of one card says very little. We take a
// second shot of a gallery: all three types, a nearly-fainted monster and a
// long name, which is where a card's layout usually breaks.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m4a2_monster_card/monster.dart';
import 'package:m4a2_monster_card/monster_card.dart';

import 'support/haudex_golden.dart';

const _emberling = Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40);

const _gallery = [
  _emberling,
  Monster(name: 'Aquaphin', type: 'water', hp: 3, maxHp: 25),
  Monster(name: 'Thornwhipperling', type: 'grass', hp: 20, maxHp: 20),
];

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: monster card', (tester) async {
    await pumpHaudex(
      tester,
      Scaffold(
        appBar: AppBar(title: const Text('HAUDEX')),
        body: const Center(child: MonsterCard(monster: _emberling)),
      ),
    );
    await shoot(tester, '01-card');

    await step(tester, '02-card-gallery', () async {
      await pumpHaudex(
        tester,
        Scaffold(
          appBar: AppBar(title: const Text('HAUDEX')),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              for (final m in _gallery)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: MonsterCard(monster: m),
                ),
            ],
          ),
        ),
      );
    });
  });
}
