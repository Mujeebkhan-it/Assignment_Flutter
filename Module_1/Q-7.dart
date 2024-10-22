//convert centigrade to farenhit F = (9/5 × °C) + 32
import 'dart:io';

void main() {
  double? cent, faren;

  print("Enter temperature in centigrade : ");
  cent = double.parse(stdin.readLineSync()!);

  faren = (1.8 * cent) + 32;
  print("Farenhit : $faren");
}
