// Write a program that accepts a number and checks if it is a prime number or not.
import 'dart:io';

void prime() {
  int? num;
  int count = 0;
  print("Enter a number : ");
  num = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= num; i++) {
    if (num % i == 0) {
      count++;
    }
  }
  if (count == 2) {
    print("$num is PRIME ");
  } else {
    print("$num is NOT PRIME");
  }
}

void main() {
  bool status = true;
  int? choice;
   while (status) {
    
    prime();
    
    print("Do you want to perform again? press 1 for yes and 2 for exit ");
    choice = int.parse(stdin.readLineSync()!);
    
    if (choice == 1) {
      status = true;
    } else {
      status = false;
      print("Thank you for visiting us ....");
    }
  }
}
