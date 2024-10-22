//Swap without third var
import 'dart:io';

void main() {
  int? a, b;

  print("Enter number1 : ");
  a = int.parse(stdin.readLineSync()!);

  print("Enter number2 : ");
  b = int.parse(stdin.readLineSync()!);

  print("before swapping");
  print("a = $a");
  print("b = $b");

  a = a + b;
  b = a - b;
  a = a - b;

  print("before swapping");
  print("a = $a");
  print("b = $b");
}
