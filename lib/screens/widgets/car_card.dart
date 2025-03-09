import 'package:car_rental_app_flutter/models/car.dart';
import 'package:car_rental_app_flutter/screens/car_details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatefulWidget {
  const CarCard({super.key, required this.car});
  final Car car;

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  void initState() {
    super.initState();
    print('car model is------------------ ${widget.car}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailsPage(
              car: widget.car,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            ),
          ],
        ),
        child: Column(
          children: [
            // Image.asset(
            //   'https://www.toyota.lk/vehicles/Yaris-Cross/Attitude-Black/vehicle1.png',
            //   height: 120,
            // ),
            Image.network(widget.car.categoryPhoto.toString(),
                height: 150, width: double.maxFinite, fit: BoxFit.cover),
            Text(
              widget.car.Model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/gps.png'),
                    Text('${widget.car.distance.toStringAsFixed(0)}km'),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/pump.png'),
                    Text('${widget.car.fuelCapacity.toStringAsFixed(0)}L')
                  ],
                ),
                Text(
                  '\$${widget.car.pricePerHour.toStringAsFixed(0)}/day',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
