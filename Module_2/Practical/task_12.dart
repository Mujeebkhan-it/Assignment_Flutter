// Create a function that accepts a list of numbers and returns the largest and smallest
// numbers in the list.

List<int> findmaxmin(List<int> numbers) {
  
  int largest = numbers[0];
  int smallest = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
    if (numbers[i] < smallest) {
      smallest = numbers[i];
    }
  }
  return [largest, smallest];
}

void main() {
  List<int> numbers = [2, 4, -5, 29, 2, 35];
  List<int> result = findmaxmin(numbers);
  
  print('Largest: ${result[0]}');
  print('Smallest: ${result[1]}');
}
