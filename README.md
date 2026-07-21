# Module 4 - Activity 2 - Monster Card (Flutter)

[![Made with Claude](https://img.shields.io/badge/Made_with-Claude-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)

Now that you have a screen, build the piece the whole HAUDEX app is made of: a card that shows one monster. You will reuse this widget in a list later.

## What to do

### 1. Fill in your details

Open `student.json` and fill in every field (use the **class code** your
instructor gave you):

```json
{
  "classCode": "1234",
  "fullName": "Juan Dela Cruz",
  "studentNumber": "2026-12345",
  "studentEmail": "juan.delacruz@hau.edu.ph",
  "personalEmail": "juan@example.com",
  "githubAccount": "juandelacruz"
}
```

> **Keep `student.json` identical across all your activities.** The autograder
> cross-checks these fields between your repos, and a mismatch (e.g. a different
> `classCode` in one activity) is flagged. The `classCode` must also match the
> one in your repo name.

### 2. Build this

Your work goes in **`lib/monster_card.dart`**.

Make `MonsterCard` show, inside a `Card`, the monster it is given:

- its **name** in a `Text` with `key: Key('name')`,
- its **type** in a `Text` with `key: Key('type')`,
- its **HP** as current / max, for example `HP 30/40`, in a `Text` with `key: Key('hp')`.

Lay it out with a **`Column`** and at least one **`Row`**. Read every value from the `monster` field - do not hard-code them. The `Monster` model in `lib/monster.dart` is given; you do not change it.

Concepts to research: `Card`, `Padding`, `Column`, `Row`, `SizedBox`, and string interpolation.

## Set up your repo

Before you write any code, create **your own copy** of this activity from the
template. Do not work in the template itself.

1. **Create from the template.** Open the template repo and click
   **Use this template -> Create a new repository**.
2. **Set the owner to the course org.** Under *Owner*, choose the **`HAU-6ADET`
   course org**, **not** your personal account.
3. **Name it by the convention** `m<module>a<activity>-<classcode>-<yourname>`.
   For this activity that's **`m4a2-<classcode>-yourname`** (e.g.
   `m4a2-1234-juandelacruz`). The `<classcode>` must match the one in
   `student.json`.
4. **Make it Private** so classmates can't see your work.

Then clone **your** new repo and work there:

```bash
git clone https://github.com/HAU-6ADET/m4a2-<classcode>-yourname.git
cd m4a2-<classcode>-yourname
```

## Run and check

```bash
flutter pub get     # fetch packages
flutter run         # launch it inside a phone frame (device_preview)
flutter test        # run the checks
```

You do not need to touch `lib/main.dart` - it just launches your screen inside a
mobile preview so you can see it as a phone. Your instructor's grader also takes
a **screenshot** of your screen inside a phone frame, so make it something you
would be happy to show.

What the tests check:

- ✅ `student.json` is filled in
- ✅ the card is a `Card`
- ✅ the name shows (keyed `name`)
- ✅ the type shows (keyed `type`)
- ✅ HP shows as current / max (keyed `hp`)
- ✅ it uses a `Column` and a `Row`
- ✅ it reflects a different monster (no hard-coded values)

Each part is graded independently, so you earn partial credit.

## Confirm your submission

Your repo **is** your submission, so there is nothing to upload. When the tests
pass, **commit and push** so your work is recorded:

```bash
git add -A
git commit -m "Activity complete"
git push
```

Pushing triggers the **Autograde** workflow, which shows a pass/fail summary.

## Codespaces

Click **Code -> Codespaces -> Create codespace**. The Flutter SDK is already set
up; run the commands above in the terminal.

### ⏱️ Make your free hours last (please read)
Your GitHub Education account includes a generous but limited monthly Codespaces
allowance. Three habits keep you from wasting it:

1. **Set your idle timeout to 10 minutes.** Go to
   **github.com/settings/codespaces -> Default idle timeout -> 10 minutes -> Save.**
2. **Stop it when you finish - don't just close the tab.** Stop it at
   **github.com/codespaces -> ••• -> Stop codespace**, or run
   *Codespaces: Stop Current Codespace* from the Command Palette.
3. **Delete the Codespace once you've submitted this activity.** After your
   final push: **github.com/codespaces -> ••• -> Delete.** You can recreate it
   later from the green **Code** button.

---
📚 **These materials were authored by [tjakoen](https://github.com/tjakoen), built with Claude.** I use AI in the open, and I expect you to use it to learn the material, not to skip the learning. [How I actually work with AI ->](https://tjakoen.github.io/notes/ten-times-zero)
