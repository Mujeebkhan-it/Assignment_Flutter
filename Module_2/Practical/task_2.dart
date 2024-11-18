// Create a program that converts temperature from Celsius to Fahrenheit and vice versa.
// Implement functions to handle both conversions and let the user choose the conversion
// type.

import 'dart:io';

void cel_to_faren() 
{
  double? cel, faren;
  print("Enter temperature in celcius : ");
  cel = double.parse(stdin.readLineSync()!);

  faren = (cel * 9) / 5 + 32;
  print("Farenhit = $faren");
}

void faren_to_cel() 
{
  double? cel, faren;
  print("Enter temperature in Farenhit : ");
  faren = double.parse(stdin.readLineSync()!);

  cel = (faren - 32) * 5 / 9;
  print("Celcius = $cel");
}

void main() 
{
  bool status = true;
  int? choice, choice2;
  print("Welcome to our temperature convertor system......");

  while (status) {
    print("Enter 1 for Celcius to Farenhit and 2 for Farenhit to Celcius :  ");
    choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      cel_to_faren();
    } else if (choice == 2) {
      faren_to_cel();
    } else {
      print("Invalid Choice...");
    }

    print("Do you want to perform again ? press 1 for yess and 2 for exit : ");
    choice2 = int.parse(stdin.readLineSync()!);

    if (choice2 == 1) {
      status = true;
    } else if (choice2 == 2) {
      status = false;
      print("Thank you for choosing us....");
    } else {
      print("Invalid choice");
    }
  }
}
