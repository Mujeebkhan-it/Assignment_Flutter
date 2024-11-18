// Create a program that takes a list of words and removes any duplicates. Use a set to
// eliminate duplicates, then display the unique words in alphabetical order.

import 'dart:io';

void main() {
  
  String? input;
  
  print('Enter a list of words : ');
  input = stdin.readLineSync()!;

  Set<String> uniqueWords = input.split(' ').toSet();

  List<String> sortedUniqueWords = uniqueWords.toList()..sort();

  print('Unique words in alphabetical order:');
  for (var word in sortedUniqueWords) {
    print(word);
  }
}
