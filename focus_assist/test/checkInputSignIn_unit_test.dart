import 'package:test/test.dart';
import 'package:focus_assist/pages/login/screen/login_screen.dart';

void main() {
  print("CheckInputSignIn");
  test('Testcase 1', () {
    var result = checkInputSignIn("phuoc686735");
    expect(result, true);
  });

  test('Testcase 2', () {
    var result = checkInputSignIn("3383739");
    expect(result, true);
  });
  test('Testcase 3', () {
    var result = checkInputSignIn("phuoc686735##");
    expect(result, false);
  });

  test('Testcase 4', () {
    var result = checkInputSignIn(" 26262626?");
    expect(result, false);
  });
  test('Testcase 5', () {
    var result = checkInputSignIn("abcxys");
    expect(result, true);
  });
  test('Testcase 6', () {
    var result = checkInputSignIn("");
    expect(result, false);
  });
  test('Testcase 7', () {
    var result = checkInputSignIn("abcc@");
    expect(result, false);
  });
  test('Testcase 8', () {
    var result = checkInputSignIn("@@!*(#");
    expect(result, false);
  });
}
