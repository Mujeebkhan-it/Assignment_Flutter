// Create a program that calculates the area and circumference of a circle. Use constants to
// store the value of pi.

import 'dart:io';

void main() {
  const pi = 3.14;
  double? area, circum, radius;
  bool status = true;
  int? choice;

  while (status) {
    print("Enter a radius : ");
    radius = double.parse(stdin.readLineSync()!);

    area = pi * radius * radius;
    circum = 2 * pi * radius;

    print("Area of circle is : $area");
    print("Circumference of circle is : $circum");

    print("Do u want to perform again? press 1 for yes and 2 for no : ");
    choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      status = true;
    } else {
      status = false;
      print("Thank you for visiting us ....");
    }
  }
}
