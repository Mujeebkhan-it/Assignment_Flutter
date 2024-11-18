// Write a function to calculate the factorial of a number entered by the user
import 'dart:io';

void fact() {
  int? num;
  int fact = 1;
  print("Enter a number : ");
  num = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= num; i++) {
    fact = fact * i;
  }
  print("Factorial of $num is = $fact");
}

void main()
{
  bool status = true;
  int? choice;
   while (status) {
    
    fact();
    
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
