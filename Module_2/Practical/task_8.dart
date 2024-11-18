// Implement a basic calculator that performs addition, subtraction, multiplication, or division
// based on the user’s choice.

import 'dart:io';

void addition() {
  int? num1, num2;
  print("Enter number 1 : ");
  num1 = int.parse(stdin.readLineSync()!);
  print("Enter number 2 : ");
  num2 = int.parse(stdin.readLineSync()!);

  print("Addition = ${num1 + num2}");
}

void substraction() {
  int? num1, num2;
  print("Enter number 1 : ");
  num1 = int.parse(stdin.readLineSync()!);
  print("Enter number 2 : ");
  num2 = int.parse(stdin.readLineSync()!);

  print("Substraction = ${num1 - num2}");
}

void multiplication() {
  int? num1, num2;
  print("Enter number 1 : ");
  num1 = int.parse(stdin.readLineSync()!);
  print("Enter number 2 : ");
  num2 = int.parse(stdin.readLineSync()!);

  print("Multiplication = ${num1 * num2}");
}

void division() {
  double? num1, num2;
  print("Enter number 1 : ");
  num1 = double.parse(stdin.readLineSync()!);
  print("Enter number 2 : ");
  num2 = double.parse(stdin.readLineSync()!);

  print("Division = ${num1 / num2}");
}

void main() {

  int? choice;
  bool status = true;
  int? num;

  while (status) {
    print("Enter 1 for Addition");
    print("Enter 2 for Substraction");
    print("Enter 3 for Multiplication");
    print("Enter 4 for Division");
    num = int.parse(stdin.readLineSync()!);

    switch (num) {
      case 1:
        addition();
        break;
      case 2:
        substraction();
        break;
      case 3:
        multiplication();
        break;
      case 4:
        division();
        break;
      default:
        print("Invalid choice");
    }

    print("Do you want to perform again? press 1 for yes and 2 for exit ");
    choice = int.parse(stdin.readLineSync()!);
    
    if (choice == 1) {
      status = true;
    } else {
      status = false;
      print("Thank you for visiting us ....");
    }
  }
}
