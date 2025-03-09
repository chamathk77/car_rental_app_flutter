import 'dart:convert';

import 'package:car_rental_app_flutter/screens/car_list_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _imageAnimation;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _buttonAnimation;

  List<Map<String, dynamic>> Cardata = [];

  @override
  void initState() {
    super.initState();

    fetchUsers();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _imageAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0), // Slide from left
      end: Offset.zero, // To its original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _textAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 0), // More delay for text
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _buttonAnimation = Tween<Offset>(
      begin: const Offset(-2.5, 0), // More delay for button
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  void fetchUsers() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('/Car_Category');

    QuerySnapshot snapshot = await users.get();
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Assuming data is in a format like { 'Yaris': [...] }
      data.forEach((key, value) {
        // Assuming the value is a list with [model, price, stock, another_stock, image_url, image_url_2, dealer_name]
        if (value is List && value.length >= 6) {
          var mappedData = {
            'model': value[0],
            'name': value[0], // Name of the car
            'distance': value[1], // Price of the car
            'fuelCapacity': value[2], // Stock quantity
            'pricePerHour': value[3], // Additional stock
            'imageUrl': value[4], // Image URL 1
            'imageUrl2': value[5], // Image URL 2
            'dealerName': value[6] // Dealer's name
          };

          print(
              "Mapped Data:----------------------------------- ${jsonEncode(mappedData['dealerName'])}");

          setState(() {
            Cardata.add(mappedData); // Add the mapped data to the list
          });
        }
      });
    }
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SlideTransition(
              position: _imageAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/onboarding.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _textAnimation,
                    child: const Text(
                      'Premium Cars . \nEnjoy the Luxury',
                      style: TextStyle(
                        color: Color.fromARGB(255, 201, 199, 199),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SlideTransition(
                    position: _textAnimation,
                    child: const Text(
                      'Premium and prestige car daily rental. \nExperience the thrill at a lower price',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SlideTransition(
                    position: _buttonAnimation,
                    child: SizedBox(
                      height: 54,
                      width: 320,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => CarListScreen(
                                        Cardata: Cardata,
                                      )),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
