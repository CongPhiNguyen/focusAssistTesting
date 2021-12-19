import 'package:test/test.dart';
import 'package:focus_assist/main.dart';
import 'package:focus_assist/pages/statistic/add_new_activity_screen.dart';

void main() {
  print("Int to DateTime");
  test('Testcase 1', () {
    var result = intToDateTime(20211205);
    expect(result, DateTime(2021, 12, 05));
  });

  test('Testcase 2', () {
    var result = intToDateTime("acs");
    expect(result.year, DateTime.now().year);
    expect(result.month, DateTime.now().month);
    expect(result.month, DateTime.now().month);
  });

  test('Testcase 3', () {
    var result = intToDateTime(20210228);
    expect(result, DateTime(2021, 02, 28));
  });

  test('Testcase 4', () {
    var result = intToDateTime(20210229);
    expect(result.year, DateTime.now().year);
    expect(result.month, DateTime.now().month);
    expect(result.month, DateTime.now().month);
  });

  test('Testcase 5', () {
    var result = intToDateTime(20291333);
    expect(result.year, DateTime.now().year);
    expect(result.month, DateTime.now().month);
    expect(result.month, DateTime.now().month);
  });

  test('Testcase 6', () {
    var result = intToDateTime(2121212192);
    expect(result.year, DateTime.now().year);
    expect(result.month, DateTime.now().month);
    expect(result.month, DateTime.now().month);
  });
}
