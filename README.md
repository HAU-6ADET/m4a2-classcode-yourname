# M4A2: Kilig: Profile Class

**Kind:** take-home practice. Do it on your own time before the next meeting. Searching, AI and helping each other are allowed, because this is practice; record what you used in `SOURCES-AND-ASSISTANCE.md`. The lab exam is closed book, so make sure you understand every line you submit.

**Kilig** needs profiles that stay valid. In the demo, the `Student` setter accepted any grade on purpose. Here your class has to **refuse** bad values, and a verified profile has to change one behaviour of its parent. It is syllabus Lab 4.

## Before you start

Follow the [setup guide](SETUP.md) to create and clone your private repository, exactly as in M1A0. The repository is named `m4a2-CLASSCODE-USERNAME`.

## What to build

In `lib/profile.dart`, write these classes, which the tests call directly:

- `Profile(String name, int age)`: the name can be read but never changed. Building a profile with an age below 18 throws an `ArgumentError`.
- `int age`: readable, and settable. A setter call with a value below 18 is **ignored**: the old age stays.
- `String bio`: an empty string to begin with. Setting a bio longer than 150 characters is **ignored**: the old bio stays. A bio of exactly 150 characters is saved.
- `bool addInterest(String interest)`: returns `true` after saving the interest without its surrounding spaces. It returns `false`, and changes nothing, when the interest is blank, when it is already there (ignoring capital letters), or when the profile already has five interests.
- `List<String> interests`: outside code can read the interests but cannot change the list. Calling `.add` on it throws an `UnsupportedError`.
- `String describe()`: `name, age: bio`, for example `Light, 18: Top student`. With no bio it ends in `No bio yet`.
- `VerifiedProfile`: a subclass that keeps every rule of `Profile` and changes only `describe()`, which adds ` (verified)` to the end of the parent's text.

`main()` in `lib/profile.dart` reads four lines: a name, an age, a bio and comma-separated interests. It builds a `Profile`, prints `Age must be 18 or older.` and stops when the age is refused, and otherwise prints `Could not add: <interest>` for each interest that was refused, then the `describe()` line.

Run your program with:

```sh
dart run lib/profile.dart
```

## Concepts to research

- Validation in a setter or a method: where a check lives so no outside code can skip it.
- When a method returns `false` and when a setter simply ignores the value. The list above says which one the tests expect.
- Read-only fields, and how to let outside code read a list it must not change.
- Overriding with `super`: reusing the parent's method, then adding to it.

## How it is graded

10 test points for correctness: the rules are tested at their edges (17 and 18, 150 and 151 characters, the fifth and sixth interest), and the tests also run `lib/profile.dart` with a valid profile and with an age of 17. 10 rubric points for logical design (10, 7, 4 or 1): where each rule lives, and whether the subclass reuses its parent.

Every activity also checks `student.json`: fill in your full name, student number, school email, class code, GitHub username, `room` and `pcNumber`, all as text.

## Check and save your work

```sh
dart analyze
dart test
```

The tests in your repository are a guide. The instructor grades from the course's own copy of the tests, so do not edit the tests to make them pass.

```sh
git status
git add lib/ student.json SOURCES-AND-ASSISTANCE.md
git commit -m "Complete M4A2"
```

In VS Code, open **Source Control** and choose **Push**, then check that the commit appears on GitHub.

## Submit the exact commit link in Canvas

Open your repository's commit history on GitHub, open the commit with your finished work, copy its full URL (it contains **/commit/**), and submit it in the Canvas assignment for M4A2 using the Website URL option. Submit the commit page, not the repository home page or a screenshot.
