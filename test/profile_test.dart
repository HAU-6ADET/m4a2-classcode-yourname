import 'package:m4a2/profile.dart';
import 'package:test/test.dart';

void main() {
  group('Profile construction and age', () {
    test('keeps the name and the age it was given', () {
      final p = Profile('Hinata', 18);
      expect(p.name, equals('Hinata'));
      expect(p.age, equals(18));
    });

    test('refuses to start below 18 with an ArgumentError', () {
      expect(() => Profile('Hinata', 17), throwsArgumentError);
    });

    test('the age setter accepts a valid age', () {
      final p = Profile('Hinata', 18);
      p.age = 25;
      expect(p.age, equals(25));
    });

    test('the age setter ignores a value below 18 and keeps the old age', () {
      final p = Profile('Hinata', 20);
      p.age = 17;
      expect(p.age, equals(20));
    });
  });

  group('Profile bio', () {
    test('a new profile has an empty bio', () => expect(Profile('Light', 18).bio, equals('')));

    test('a bio of exactly 150 characters is saved', () {
      final p = Profile('Light', 18);
      final text = 'a' * 150;
      p.bio = text;
      expect(p.bio, equals(text));
    });

    test('a bio over 150 characters is ignored and the old bio stays', () {
      final p = Profile('Light', 18);
      p.bio = 'Top student';
      p.bio = 'a' * 151;
      expect(p.bio, equals('Top student'));
    });
  });

  group('Profile interests', () {
    test('addInterest returns true and stores the trimmed interest', () {
      final p = Profile('Light', 18);
      expect(p.addInterest('  chess '), isTrue);
      expect(p.interests, equals(['chess']));
    });

    test('a blank interest is refused with false', () {
      final p = Profile('Light', 18);
      expect(p.addInterest('   '), isFalse);
      expect(p.interests, isEmpty);
    });

    test('a repeated interest is refused, ignoring capital letters', () {
      final p = Profile('Light', 18);
      p.addInterest('Chess');
      expect(p.addInterest('chess'), isFalse);
      expect(p.interests, hasLength(1));
    });

    test('a sixth interest is refused and the list stays at five', () {
      final p = Profile('Light', 18);
      for (final i in ['a', 'b', 'c', 'd', 'e']) {
        expect(p.addInterest(i), isTrue);
      }
      expect(p.addInterest('f'), isFalse);
      expect(p.interests, equals(['a', 'b', 'c', 'd', 'e']));
    });

    test('outside code cannot change the interests list directly', () {
      final p = Profile('Light', 18);
      p.addInterest('chess');
      expect(() => p.interests.add('cheating'), throwsUnsupportedError);
      expect(p.interests, equals(['chess']));
    });
  });

  group('describe and VerifiedProfile', () {
    test('describe shows the name, age and bio', () {
      final p = Profile('Light', 18)..bio = 'Top student';
      expect(p.describe(), equals('Light, 18: Top student'));
    });

    test('describe says No bio yet when the bio is empty', () {
      expect(Profile('Light', 18).describe(), equals('Light, 18: No bio yet'));
    });

    test('a verified profile adds (verified) to its parent description', () {
      final v = VerifiedProfile('Light', 18)..bio = 'Top student';
      expect(v.describe(), equals('Light, 18: Top student (verified)'));
    });

    test('a verified profile keeps every rule of its parent', () {
      expect(() => VerifiedProfile('Light', 17), throwsArgumentError);
      final v = VerifiedProfile('Light', 18);
      v.age = 17;
      expect(v.age, equals(18));
      for (final i in ['a', 'b', 'c', 'd', 'e']) {
        v.addInterest(i);
      }
      expect(v.addInterest('f'), isFalse);
    });

    test('a list of Profile describes each by its own rule', () {
      final List<Profile> all = [Profile('Light', 18), VerifiedProfile('Hinata', 19)];
      expect(all.map((p) => p.describe()).toList(),
          equals(['Light, 18: No bio yet', 'Hinata, 19: No bio yet (verified)']));
    });
  });
}
