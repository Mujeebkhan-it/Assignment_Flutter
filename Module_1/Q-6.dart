//Simple Interest
import 'dart:io';

void main() {
  int? p, r, t;
  double? si;

  print("Enter a principal : ");
  p = int.parse(stdin.readLineSync()!);

  print("Enter a rate of interest : ");
  r = int.parse(stdin.readLineSync()!);

  print("Enter a Time : ");
  t = int.parse(stdin.readLineSync()!);

  si = (p * r * t) / 100;
  print("Simple Interest is : $si");
}
