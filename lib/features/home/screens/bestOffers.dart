import 'package:arestro_app/features/details/screens/bestDishes.dart';
import 'package:flutter/material.dart';

class BestOffers extends StatefulWidget {
  static const String routeName = '/bestOffers';

  const BestOffers({
    super.key,
  });

  @override
  State<BestOffers> createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  List<String> dishes() {
    return [
      'Burger',
      'Pizza',
      'Burger',
      'Pizza',
      'Burger',
      'Pizza',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Best Offers',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.98,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.whatshot,
                    size: 20,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Text(
                    'See all',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
        BestDishes(listDishes: dishes()),
      ],
    );
  }
}
