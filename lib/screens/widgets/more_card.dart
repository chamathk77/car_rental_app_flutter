import 'package:car_rental_app_flutter/models/car.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.Model,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '> ${car.distance} km',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.battery_full,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        car.fuelCapacity.toString() + 'L',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              )
            ],
          )
        ],
      ),
    );
  }
}
