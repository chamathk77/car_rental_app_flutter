import 'package:flutter/widgets.dart';

class Car {
  final String Model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final String? categoryPhoto; // URL for category image
  final String? mainPhoto; // URL for main image

  Car({
    required this.Model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    this.categoryPhoto,
    this.mainPhoto,
  });
}
