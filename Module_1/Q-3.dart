//make a Square and cube of number
import 'dart:io';

void main() {
  
  int? num, squre, cube;
  print("Enter Your Number : ");
  num = int.parse(stdin.readLineSync()!);

  squre = num * num;
  cube = num * num * num;

  print("Squre of given number is : $squre");
  print("Cube of given number is : $cube");
}
