import 'package:car_rental_app_flutter/models/car.dart';
import 'package:car_rental_app_flutter/screens/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatefulWidget {
  CarListScreen({super.key, required this.Cardata});

  final List Cardata;

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  late List<Car> cars;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Map the Cardata to list of Car objects
    cars = widget.Cardata.map<Car>((data) {
      return Car(
        Model: data['model'], // Map the 'model' field from the data
        distance: data['distance'], // Map the 'distance' field
        fuelCapacity: data['fuelCapacity'], // Map the 'fuelCapacity' field
        pricePerHour: data['pricePerHour'], // Map the 'pricePerHour' field
        categoryPhoto: data['imageUrl'] ?? '', // Map the first image URL
        mainPhoto: data['imageUrl2'] ?? '', // Map the second image URL
        dealerName: data['dealerName'] ?? '',
      );
    }).toList();

    // Initialize animations for the list
    _animations = List.generate(
      cars.length,
      (index) =>
          Tween<Offset>(begin: const Offset(0, -1.5), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeOut),
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
          child: CarCard(car: cars[index]), // Render each car in the list
        ),
      ),
    );
  }
}
