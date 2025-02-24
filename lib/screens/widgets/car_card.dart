import 'package:car_rental_app_flutter/models/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            'assets/car_image.png',
            height: 120,
          ),
          Text(
            car.Model,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset('assets/star.png'),
                  Text('${car.distance.toStringAsFixed(0)}km')
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/pump.png'),
                  Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
