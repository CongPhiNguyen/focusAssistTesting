import 'package:test/test.dart';
import 'package:focus_assist/pages/progress_screen.dart';

void main() {
  print("Check Group Name Constraint");
  test('Testcase 1', () {
    var result = NumberOfDaysInMonth(2, 2020);
    expect(result, 29);
  });

  test('Testcase 2', () {
    var result = NumberOfDaysInMonth(2, 2021);
    expect(result, 28);
  });
  test('Testcase 3', () {
    var result = NumberOfDaysInMonth(6, 2020);
    expect(result, 30);
  });
  test('Testcase 4', () {
    var result = NumberOfDaysInMonth(7, 2021);
    expect(result, 31);
  });
  test('Testcase 5', () {
    var result = NumberOfDaysInMonth(13, 2021);
    expect(result, -1);
  });
}
