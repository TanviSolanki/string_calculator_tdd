import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator/string_calculator.dart';

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
}