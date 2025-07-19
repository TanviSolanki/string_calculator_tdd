import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  test('Empty string should return 0', () {
    final calculator = StringCalculator();
    expect(calculator.add(''), 0);
  });
  test('Single number should return itself', () {
    final calculator = StringCalculator();
    expect(calculator.add('1'), 1);
  });
  test('Two numbers separated by comma should return their sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2'), 3);
  });
  test('Multiple numbers should return their sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,2,3,4'), 10);
  });
  test('Newlines between numbers are treated as delimiters', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), 6);
  });
  test('Custom delimiter should be supported', () {
    final calculator = StringCalculator();
    expect(calculator.add('//;\n1;2'), 3);
  });
  test('Negative numbers throw exception', () {
    final calculator = StringCalculator();
    expect(() => calculator.add('1,-2,3'), throwsA(predicate((e) =>
    e is FormatException &&
        e.message == 'negative numbers not allowed: -2')));
  });
}