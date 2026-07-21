import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'monster.dart';
import 'monster_card.dart';

// Entry point. You do not need to change this - run it to preview your card on
// a phone. Your work goes in `monster_card.dart`.
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const HaudexApp(),
    ),
  );
}

class HaudexApp extends StatelessWidget {
  const HaudexApp({super.key});

  @override
  Widget build(BuildContext context) {
    const sample = Monster(name: 'Emberling', type: 'fire', hp: 30, maxHp: 40);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
        appBar: AppBar(title: const Text('HAUDEX')),
        body: const Center(child: MonsterCard(monster: sample)),
      ),
    );
  }
}
