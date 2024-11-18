import 'dart:io';

void main() {
  int? num;
  bool status = true;
  int? choice;

  while (status) {
    print("Enter a number : ");
    num = int.parse(stdin.readLineSync()!);
    if (num % 2 == 0) {
      print("$num is even");
    } else {
      print("$num is odd");
    }

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
