// Write a program that takes a user's name and age as input and prints a welcome message
// that includes their name and how many years they have left until they turn 100

import 'dart:io';

void main() {
  int? age;
  String? name;

  print("Enter your name : ");
  name = stdin.readLineSync()!;

  print("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  int find_age = 100 - age;

  print("Welcome $name... after $find_age years you'll turn 100");
}
