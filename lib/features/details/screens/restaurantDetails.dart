import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/home/screens/bestOffers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantDetails extends StatefulWidget {
  static const String routeName = '/restaurantDetails';
  final String restaurantName;
  final String restaurantImage;
  final double rating;

  const RestaurantDetails({
    required this.restaurantName,
    required this.restaurantImage,
    required this.rating,
  });

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  List<String> dishes() {
    return [
      'Burger',
      'Pizza',
      'Hot Dog',
      'Sandwich',
      'Popcorn',
      'Potato Chips',
      'Juice',
      'Soda',
      'Coffee',
    ];
  }

  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/Appbar.png',
          height: 38.45,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(widget.restaurantImage),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.restaurantName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          letterSpacing: 0.8,
                        ),
                      ),
                      const Spacer(),
                      RatingBar(
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Color(0xffFEAD1D),
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Color(0xffFEAD1D),
                          ),
                          empty: const Icon(
                            Icons.star_border,
                            color: Color(0xffFEAD1D),
                          ),
                        ),
                        initialRating: widget.rating,
                        minRating: 1,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        allowHalfRating: true,
                        unratedColor: Colors.grey,
                        itemSize: 20.85,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_rounded,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "1Km from Location",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Manrope',
                          letterSpacing: 0.8,
                          color: Color(0xff000000),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/maps');
                        },
                        child: Text(
                          "View on Map",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Manrope',
                            letterSpacing: 0.8,
                            color: GlobalVariable.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  // description
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        letterSpacing: 0.8,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed semper nunc. Sed euismod, nunc sit amet aliquam lacinia, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc sit amet aliquam lacinia, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl.",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Manrope',
                      letterSpacing: 0.8,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Facilities",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                          letterSpacing: 0.8,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Manrope',
                            letterSpacing: 0.8,
                            color: GlobalVariable.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.done,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Snackbar',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope',
                              letterSpacing: 0.8,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.done,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Toilet',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope',
                              letterSpacing: 0.8,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Icon(
                            Icons.done,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Bike Parking',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope',
                              letterSpacing: 0.8,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.done,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '24/7 Service',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope',
                              letterSpacing: 0.8,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Row(
                      children: [
                        CustomButtom(
                          text: 'View\nMenu',
                          onPressed: () {},
                          color: GlobalVariable.primaryColor,
                          textColor: Colors.white,
                          round: 5,
                          size: 0.2,
                          textSize: 12,
                        ),
                        const Spacer(),
                        CustomButtom(
                          text: 'View Available Tables',
                          onPressed: () {},
                          color: GlobalVariable.primaryColor,
                          textColor: Colors.white,
                          round: 5,
                          size: 0.5,
                          textSize: 14,
                        ),
                        const Spacer(),
                        CustomButtom(
                          text: 'Favourite',
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                            // if (isFavourite) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text('Added to Favourite'),
                            //     ),
                            //   );
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text('Removed from Favourite'),
                            //     ),
                            //   );
                            // }
                          },
                          color: GlobalVariable.primaryColor,
                          textColor: Colors.white,
                          round: 5,
                          size: 0.15,
                          textSize: 12,
                          isfavorite: isFavourite,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  BestOffers()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Positioned(
//             top: MediaQuery.of(context).size.height * 0.5,
//             left: 40,
//             right: 40,
//             child: CustomButtom(
//                 text: 'View Available Tables',
//                 onPressed: () {},
//                 color: GlobalVariable.primaryColor,
//                 textColor: Colors.white,
//                 round: 5),
//           ),
