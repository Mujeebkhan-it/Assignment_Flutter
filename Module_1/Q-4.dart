//Area of a circle
import 'dart:io';

void main() {
  const pi = 3.14;
  double? r, area;

  print("Enter a radius of a circle : ");
  r = double.parse(stdin.readLineSync()!);
  area = pi * (r * r);

  print("Area of a circle is : $area");
}
