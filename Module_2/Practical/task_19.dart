// Create a class hierarchy with a Vehicle superclass and Car and Bike subclasses. Implement
// methods in each subclass that print specific details, like the type of vehicle, fuel type, and
// max speed.

class Vehicle 
{
  String fuelType;
  int maxSpeed;
  Vehicle(this.fuelType, this.maxSpeed);
  void printdetails() {
    print("Fuel type: $fuelType");
    print("Max speed: ${maxSpeed}km/h");
  }
}

class Car extends Vehicle {
  int doors;
  Car(String fuelType, int maxSpeed, this.doors) : super(fuelType, maxSpeed);

  @override
  void printdetails() {
    print("Vehicle Type: Car");
    print("Fuel type: $fuelType");
    print("Max speed: ${maxSpeed}km/h");
    print("Number of doors: $doors");
  }
}
class Bike extends Vehicle {
  bool hasCarrier;
  Bike(String fuelType, int maxSpeed, this.hasCarrier) : super(fuelType, maxSpeed);
  @override
  void printdetails() {
    print("Vehicle Type: Bike");
    print("Fuel type: $fuelType");
    print("Max speed: ${maxSpeed}km/h");
    print("Has carrier: ${hasCarrier ? "Yes" : "No"}");
  }
}
void main() {
  Car myCar = Car("Petrol", 180, 4);
  myCar.printdetails();
  print("\n");

  Bike myBike = Bike("Electric", 80, true);
  myBike.printdetails();
}
