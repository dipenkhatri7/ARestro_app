import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/cart/screens/cardCard.dart';
import 'package:arestro_app/features/cart/screens/totalCard.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  static const String routeName = '/cart';
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 7.5,
            image: AssetImage('assets/images/top.png'),
            alignment: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Details',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CardCard(
                      price: 200,
                    ),
                    CardCard(
                      price: 150,
                    ),
                    CardCard(
                      price: 100,
                    ),
                    CardCard(
                      price: 50,
                    ),
                    CardCard(
                      price: 199,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TotalCard()
            ],
          ),
        ),
      ),
    );
  }
}
