// Create a function that checks if a string is a palindrome (reads the same backward as
// forward).
import 'dart:io';

void palindrom(){
  
  String? originalString;
  print("Enter a string");
  originalString = stdin.readLineSync()!;

  //split individual char from string and store it into
  List<String> char = originalString.split("");
  String reversedString = char.reversed.join();

  print(reversedString);

  if (originalString == reversedString) {
    print("Palindrom");
  } else {
    print("Not Palindrom");
  }
}

void main() {
  palindrom();
}
