import 'package:test/test.dart';
import 'package:focus_assist/pages/statistic/add_new_activity_screen.dart';

void main() {
  print("DateTime to Int");
  test('Testcase 1', () {
    var result = dateTimeToInt(DateTime(2021, 02, 15));
    expect(result, 20210215);
  });

  test('Testcase 2', () {
    var result = dateTimeToInt("acs");
    expect(result, -1);
  });

  test('Testcase 3', () {
    var result = dateTimeToInt(DateTime(2021, 02, 28));
    expect(result, 20210228);
  });

  test('Testcase 4', () {
    var result = dateTimeToInt(DateTime(2021, 02, 29));
    expect(result, -1);
  });

  test('Testcase 5', () {
    var result = dateTimeToInt(DateTime(2029, 13, 33));
    expect(result, -1);
  });

  test('Testcase 6', () {
    var result = dateTimeToInt(212121212);
    expect(result, -1);
  });
}
