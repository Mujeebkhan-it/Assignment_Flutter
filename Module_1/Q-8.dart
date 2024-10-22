//Find the percentage
import 'dart:io';

void main() {
  int? ios, flutter, react, database, andoid, totle;
  double? percentage;

  print("Enter the marks of iOS subject : ");
  ios = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Flutter subject : ");
  flutter = int.parse(stdin.readLineSync()!);

  print("Enter the marks of React subject : ");
  react = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Database subject : ");
  database = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Android subject : ");
  andoid = int.parse(stdin.readLineSync()!);

  totle = ios + flutter + react + database + andoid;
  percentage = totle / 5;

  print("Your Percentage is : $percentage");
}
