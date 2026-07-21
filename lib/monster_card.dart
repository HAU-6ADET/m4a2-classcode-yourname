import 'package:flutter/material.dart';

import 'monster.dart';

/// Module 4 - Activity 2 - Monster Card
///
/// Build a reusable card widget that displays ONE [Monster]. Given a monster,
/// `MonsterCard` should show, inside a `Card`:
///
///   * the monster's name, in a `Text` with `key: Key('name')`,
///   * its type, in a `Text` with `key: Key('type')`,
///   * its HP as current / max (for example "HP 30/40"), in a `Text` with
///     `key: Key('hp')`.
///
/// Lay the content out with a `Column`, and use at least one `Row` (for
/// example, the name beside the type). Read the values from the `monster`
/// field - do not hard-code "Emberling" or "40".
///
/// Concepts to research:
///   - `Card`, `Padding`, `Column`, `Row`, and spacing (`SizedBox`)
///   - reading a widget's constructor field in `build`
///   - string interpolation, for example '${monster.hp}/${monster.maxHp}'
class MonsterCard extends StatelessWidget {
  final Monster monster;

  const MonsterCard({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    // TODO: return a Card that shows the monster's name, type, and HP.
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('TODO: show the monster'),
      ),
    );
  }
}
