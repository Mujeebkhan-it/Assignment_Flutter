// Write a recursive function to generate the Fibonacci series up to a specified number.
int fib(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return fib(n-1) + fib(n-2);
  }
}

void main() {
  print(fib(5));
}
