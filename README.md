# Module 4 - Activity 2 - Monster Card (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

Now that you have a screen, build the piece the whole HAUDEX app is made of: a
**card that shows one monster**. You will reuse this widget in a list later.

## Build this

Open `lib/monster_card.dart` and make `MonsterCard` show, inside a `Card`, the
monster it is given:

- its **name** in a `Text` with `key: Key('name')`,
- its **type** in a `Text` with `key: Key('type')`,
- its **HP** as current / max, for example `HP 30/40`, in a `Text` with
  `key: Key('hp')`.

Lay it out with a **`Column`** and at least one **`Row`**. Read every value from
the `monster` field - do not hard-code them (the tests pass in different
monsters).

The `Monster` model in `lib/monster.dart` is given; you do not change it.

## Run and check

```bash
flutter pub get
flutter run       # see your card on a phone
flutter test      # check it against the contract
```

The grader also photographs your card inside a phone frame, so make it look
tidy: padding, spacing, and a sensible arrangement.

## Submit

Fill in `student.json`, commit, and push. Autograde runs automatically.
