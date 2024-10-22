//Display info using print

import 'dart:io';

void main() {
  String? name, b_date, addr;
  int? age;
  print("Enter your name : ");
  name = stdin.readLineSync()!;

  print("Enter your Birthdate : ");
  b_date = stdin.readLineSync()!;

  print("Enter your Age : ");
  age = int.parse(stdin.readLineSync()!);

  print("Enter your Address : ");
  addr = stdin.readLineSync()!;

  print("\nName : $name");
  print("Birthdate : $b_date");
  print("Age : $age");
  print("Address : $addr");
}
