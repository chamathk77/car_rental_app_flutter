import 'package:car_rental_app_flutter/models/car.dart';
import 'package:car_rental_app_flutter/screens/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({Key? key}) : super(key: key);

  final List<Car> cars = [
    Car(
      Model: 'Toyota',
      distance: 100,
      fuelCapacity: 50,
      pricePerHour: 55,
    ),
    Car(
      Model: 'Toyota',
      distance: 100,
      fuelCapacity: 50,
      pricePerHour: 55,
    ),
    Car(
      Model: 'Toyota',
      distance: 100,
      fuelCapacity: 50,
      pricePerHour: 55,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Car'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) => CarCard(
            car: cars[index],
          ),
        ));
  }
}
