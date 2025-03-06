import 'package:car_rental_app_flutter/models/car.dart';
import 'package:car_rental_app_flutter/screens/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatefulWidget {
  CarListScreen({Key? key}) : super(key: key);

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  final List<Car> cars = [
    Car(
      Model: 'Toyota',
      distance: 100,
      fuelCapacity: 50,
      pricePerHour: 55,
    ),
    Car(
      Model: 'Honda',
      distance: 120,
      fuelCapacity: 45,
      pricePerHour: 60,
    ),
    Car(
      Model: 'BMW',
      distance: 80,
      fuelCapacity: 40,
      pricePerHour: 100,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animations = List.generate(
      cars.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, -1.5), // Start from top
        end: Offset.zero, // Move to normal position
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Delay each item slightly
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => SlideTransition(
          position: _animations[index], // Apply animation per car
          child: CarCard(car: cars[index]),
        ),
      ),
    );
  }
}
