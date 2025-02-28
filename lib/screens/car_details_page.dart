import 'package:car_rental_app_flutter/models/car.dart';
import 'package:car_rental_app_flutter/screens/widgets/car_card.dart';
import 'package:car_rental_app_flutter/screens/widgets/more_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text('Infomation'),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
              Model: 'Toyota Prado 4x4 TX',
              distance: 100,
              fuelCapacity: 50,
              pricePerHour: 55,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/user.png',
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Chamath Kodithuwakku',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$4.253',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/maps.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    Model: 'Toyota Prado 4x4 TX',
                    distance: 100,
                    fuelCapacity: 50,
                    pricePerHour: 55,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MoreCard(
                  car: Car(
                    Model: 'Toyota Prado 4x4 TX',
                    distance: 100,
                    fuelCapacity: 50,
                    pricePerHour: 55,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MoreCard(
                  car: Car(
                    Model: 'Toyota Prado 4x4 TX',
                    distance: 100,
                    fuelCapacity: 50,
                    pricePerHour: 55,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
