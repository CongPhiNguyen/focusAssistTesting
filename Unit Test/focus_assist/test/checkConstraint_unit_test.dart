import 'package:test/test.dart';
import 'package:focus_assist/pages/statistic/add_new_activity_screen.dart';

void main() {
  print("Check Constraint");
  test('Testcase 1', () {
    var result = checkConstraint(
        "", "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 2, "");
    expect(result, false);
  });

  test('Testcase 2', () {
    var result = checkConstraint(
        " ", "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 2, "");
    expect(result, false);
  });

  test('Testcase 3', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 2, "");
    expect(result, true);
  });

  test('Testcase 4', () {
    var result = checkConstraint("Playing chess", "", "abc", "Flexible", 2, "");
    expect(result, false);
  });

  test('Testcase 5', () {
    var result = checkConstraint("Playing chess", " ", "abc", "Fixed", 2, "");
    expect(result, false);
  });

  test('Testcase 6', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Fixed", 2, "");
    expect(result, true);
  });
  test('Testcase 7', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "None", "Flexible", 2, "");
    expect(result, false);
  });
  test('Testcase 8', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 2, "");
    expect(result, true);
  });
  test('Testcase 9', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", "", "");
    expect(result, false);
  });
  test('Testcase 10', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", "a", "");
    expect(result, false);
  });
  test('Testcase 11', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 12, "");
    expect(result, false);
  });
  test('Testcase 12', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 0, "");
    expect(result, false);
  });
  test('Testcase 13', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 7, "");
    expect(result, true);
  });

  test('Testcase 14', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Flexible", 2, "");
    expect(result, true);
  });

  test('Testcase 15', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Repeating", 2, "a");
    expect(result, false);
  });
  test('Testcase 16', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Repeating", 2, 0);
    expect(result, false);
  });

  test('Testcase 17', () {
    var result = checkConstraint("Playing chess",
        "Luyện chơi cờ hai giờ mỗi ngày", "abc", "Repeating", 2, 12);
    expect(result, true);
  });
}
