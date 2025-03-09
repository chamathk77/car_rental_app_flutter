import 'package:flutter/widgets.dart';

class Car {
  final String Model;
  final int distance;
  final int fuelCapacity;
  final int pricePerHour;
  final String? categoryPhoto; // URL for category image
  final String? mainPhoto;
  final String? dealerName; 
  // URL for main image

  Car({
    required this.Model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    this.categoryPhoto,
    this.mainPhoto,
    this.dealerName
  });
}
