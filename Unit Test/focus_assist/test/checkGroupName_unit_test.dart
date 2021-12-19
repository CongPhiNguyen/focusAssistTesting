import 'package:test/test.dart';
import 'package:focus_assist/pages/statistic/add_new_activity_screen.dart';

void main() {
  print("Check Group Name Constraint");
  test('Testcase 1', () {
    var result = checkConstraintAddNewGroup("");
    expect(result, false);
  });

  test('Testcase 2', () {
    var result = checkConstraintAddNewGroup("Coding");
    expect(result, true);
  });
}
