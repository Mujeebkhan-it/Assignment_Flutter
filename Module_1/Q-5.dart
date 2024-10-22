//Area of Triangle
import 'dart:io';

void main() {
  
  double? b, h, area;

  print("Enter the base of a Triangle : ");
  b = double.parse(stdin.readLineSync()!);

  print("Enter the height of a Traingle : ");
  h = double.parse(stdin.readLineSync()!);

  area = 0.5 * b * h;
  print("Area of Triangle is : $area");
}
