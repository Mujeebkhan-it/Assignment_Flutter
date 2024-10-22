//Check number is positve or negative
import 'dart:io';

void main() {
  int? num;

  print("Enter a number : ");
  num = int.parse(stdin.readLineSync()!);

  if (num == 0) {
    print("$num is static");
  } else if (num > 0) {
    print("$num is positive");
  } else if (num < 0) {
    print("$num is Negative");
  }
}
