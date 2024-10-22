//Calculator
import 'dart:io';

void main() {
  double? num1, num2;

  print("Enter number 1 = ");
  num1 = double.parse(stdin.readLineSync()!);

  print("Enter number 2 = ");
  num2 = double.parse(stdin.readLineSync()!);

  double sum = num1 + num2;
  double sub = num1 - num2;
  double mul = num1 * num2;
  double div = num1 / num2;

  print("\nAddition of number is = $sum");
  print("Substraction of number is = $sub");
  print("Multiplication of number is = $mul");
  print("Division of number is = $div");
}
