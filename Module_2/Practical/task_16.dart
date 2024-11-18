// Create a simple address book using a map, where the keys are names and the values are
// phone numbers. Add, update, and remove entries based on user input.

import 'dart:io';

void addEntry(Map<String, String> addressBook) {
  print("Enter name: ");
  String? name = stdin.readLineSync()!;

  print("Enter phone number: ");
  String? phone = stdin.readLineSync()!;

  addressBook[name] = phone;
  print("Entry added successfully!");
  
}

void updateEntry(Map<String, String> addressBook) {
  print("Enter the name to update: ");
  String? name = stdin.readLineSync()!;

  if (addressBook.containsKey(name)) {
    print("Enter new phone number: ");
    String? phone = stdin.readLineSync();

    if (phone != null) {
      addressBook[name] = phone;
      print("Entry updated successfully!");
    }
  } else {
    print("Name not found in the address book.");
  }
}

void removeEntry(Map<String, String> addressBook) {
  print("Enter the name to remove: ");
  String? name = stdin.readLineSync()!;

  if (addressBook.containsKey(name)) {
    addressBook.remove(name);
    print("Entry removed successfully!");
  } else {
    print("Name not found in the address book.");
  }
}

void viewAddressBook(Map<String, String> addressBook) {
  if (addressBook.isEmpty) {
    print("Address book is empty.");
  } else {
    print("\nAddress Book:");
    addressBook.forEach((name, phone) {
      print("$name: $phone");
    });
  }
}

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print("\nAddress Book Menu:");
    print("1. Add entry");
    print("2. Update entry");
    print("3. Remove entry");
    print("4. View address book");
    print("5. Exit");
    print("Enter your choice: ");

    String? choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        addEntry(addressBook);
        break;

      case '2':
        updateEntry(addressBook);
        break;

      case '3':
        removeEntry(addressBook);
        break;

      case '4':
        viewAddressBook(addressBook);
        break;

      case '5':
        print("Exiting address book.");
        viewAddressBook(addressBook);
        print("Thsnk you.....!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
