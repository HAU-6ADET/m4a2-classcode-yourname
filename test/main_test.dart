import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

// Runs lib/profile.dart the way `dart run lib/profile.dart` does, types one
// profile into it, and checks what main() prints.
Future<ProcessResult> runProgram(String path, String input) async {
  final process = await Process.start(Platform.resolvedExecutable, ['run', path]);
  process.stdin.write(input);
  await process.stdin.close();
  final out = process.stdout.transform(utf8.decoder).join();
  final err = process.stderr.transform(utf8.decoder).join();
  final code = await process.exitCode.timeout(const Duration(seconds: 90));
  return ProcessResult(process.pid, code, await out, await err);
}

void main() {
  group('main() in lib/profile.dart', () {
    test('lib/profile.dart exists and declares main()', () {
      final file = File('lib/profile.dart');
      expect(file.existsSync(), isTrue, reason: 'Keep your program in lib/profile.dart.');
      expect(file.readAsStringSync(), matches(RegExp(r'\bmain\s*\(')),
          reason: 'lib/profile.dart needs a main() function so `dart run` can start it.');
    });

    test('shows the profile and names each refused interest', () async {
      // Six interests: the sixth must be refused. The bio is short and valid.
      const input = 'Hinata\n18\nWants to fly\n'
          'volleyball,food,milk,orange,jump,chess\n';
      final result = await runProgram('lib/profile.dart', input);
      expect(result.exitCode, equals(0),
          reason: '`dart run lib/profile.dart` must finish without an error.\n${result.stderr}');
      final output = result.stdout as String;
      expect(output, contains('Hinata, 18: Wants to fly'), reason: 'Print the describe() line.');
      expect(output, contains('Could not add: chess'), reason: 'Name the interest that was refused.');
    }, timeout: const Timeout(Duration(minutes: 2)));

    test('a profile under 18 is reported, not crashed on', () async {
      final result = await runProgram('lib/profile.dart', 'Hinata\n17\nWants to fly\nvolleyball\n');
      expect(result.exitCode, equals(0),
          reason: 'An age below 18 must be reported, not crash the program.\n${result.stderr}');
      expect(result.stdout as String, contains('Age must be 18 or older.'));
    }, timeout: const Timeout(Duration(minutes: 2)));
  });
}
