// M4A2 Kilig: Profile Class. Replace each placeholder body.
// Read README.md for the rules. The tests call these classes directly.

class Profile {
  final String name;
  int age;
  String bio = '';
  final List<String> interests = [];

  Profile(this.name, this.age);

  bool addInterest(String interest) {
    return false;
  }

  String describe() {
    return '';
  }
}

class VerifiedProfile extends Profile {
  VerifiedProfile(super.name, super.age);
}

// The console program. Read README.md for what it must ask and print.
// Run it with: dart run lib/profile.dart
void main() {
  print('Kilig profile: not built yet');
}
