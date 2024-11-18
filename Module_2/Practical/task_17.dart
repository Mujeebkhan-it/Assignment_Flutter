// Create a class called Book with properties like title, author, and publication year. Add
// methods to display the book’s details and a method to check if it’s over 10 years old.

class Book {
  
  String? title;
  String? author;
  int? publicationYear;

  Book(this.title, this.author, this.publicationYear);

  void display() {
    print('Title: $title');
    print('Author: $author');
    print('Publication Year: $publicationYear');
    print("\n");
  }

  bool isOver10YearsOld() {
    int currentYear = DateTime.now().year;
    int age = currentYear - publicationYear!;
    return age > 10;
  }
}

void main() {
  var book1 = Book("2 States", "Adit Kapoor", 2006);
  var book2 = Book("Vampires", "George Brown", 2020);

  book1.display();
  book2.display();

  print('${book1.title} over 10 years old? ${book1.isOver10YearsOld()}');
  print('${book2.title} over 10 years old? ${book2.isOver10YearsOld()}');
}
