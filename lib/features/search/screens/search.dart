import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/details/screens/restaurantDetails.dart';
import 'package:arestro_app/features/home/widgets/searchButton.dart';
import 'package:arestro_app/features/settings/widgets/settingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Search extends StatefulWidget {
  static const String routeName = '/search';
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _popularRestaurants = [
    {
      'name': 'Restaurant 1',
      'rating': 3.5,
      'description': 'Description 1',
      'location': 'Location 1',
      'distance': 1.5,
      'status': 'Crowded',
    },
    {
      'name': 'Restaurant 2',
      'rating': 4.0,
      'description': 'Description 2',
      'location': 'Location 2',
      'distance': 2.5,
      'status': 'Open',
    },
    {
      'name': 'Restaurant 3',
      'rating': 3.5,
      'description': 'Description 3',
      'location': 'Location 3',
      'distance': 3.5,
      'status': 'Closed',
    },
    {
      'name': 'Restaurant 1',
      'rating': 4.5,
      'description': 'Description 1',
      'location': 'Location 1',
      'distance': 4.5,
      'status': 'Crowded',
    },
    {
      'name': 'Restaurant 2',
      'rating': 4.0,
      'description': 'Description 2',
      'location': 'Location 2',
      'distance': 5.5,
      'status': 'Open',
    },
    {
      'name': 'Restaurant 3',
      'rating': 3.5,
      'description': 'Description 3',
      'location': 'Location 3',
      'distance': 6.5,
      'status': 'Closed',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsContainer(
                isSettings: true,
                elevation: 1.5,
                boarderRadius: 8,
                size: 0.2385,
                child: Padding(
                  padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Find a restaurants nearby',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Manrope',
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      SearchButton(
                        searchController: _searchController,
                        height: 40,
                        prefix: Icon(
                          Icons.search_outlined,
                          color: Color(0xff000000).withOpacity(0.74),
                        ),
                        postfix: Icon(
                          Icons.mic_outlined,
                          color: Color(0xff000000).withOpacity(0.74),
                        ),
                        hintText: "Search for Restaurants",
                      ),
                      CustomButtom(
                        text: 'Search',
                        onPressed: () {},
                        color: GlobalVariable.primaryColor,
                        textColor: Colors.white,
                        round: 5,
                        height: 40,
                        textSize: 16,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Advanced Search',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Manrope',
                              letterSpacing: 0.8,
                              color: Color(0xff000000).withOpacity(0.5),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Restaurants',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff000000).withOpacity(0.70),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      letterSpacing: .8,
                    ),
                  ),
                  const Text(
                    'Results: 10',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                child: ListView.builder(
                  physics: const ScrollPhysics(parent: null),
                  shrinkWrap: true,
                  itemCount: _popularRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = _popularRestaurants[index];
                    // final Color color = restaurant['status'] == 'Open'
                    //     ? GlobalVariable.primaryColor
                    //     : restaurant['status'] == 'Closed'
                    //         ? GlobalVariable.cancelColor
                    //         : Colors.orange;
                    return Container(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 16, left: 8, right: 8),
                      margin: EdgeInsets.only(bottom: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetails(
                                restaurantImage: 'assets/images/Restaurant.png',
                                restaurantName: restaurant['name'],
                                rating: restaurant['rating'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Restaurant.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            restaurant['name'],
                                            style: const TextStyle(
                                              fontSize: 16,
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
                                            initialRating: restaurant['rating'],
                                            minRating: 1,
                                            ignoreGestures: true,
                                            direction: Axis.horizontal,
                                            itemCount: 5,
                                            allowHalfRating: true,
                                            unratedColor: Colors.grey,
                                            itemSize: 15.85,
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                      Text(
                                        restaurant['location'],
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.8,
                                          color: Color(0xff000000)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                        restaurant['description'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.8,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.pin_drop_rounded,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${restaurant['distance']} Km away from your location",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.8,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  restaurant['status'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.8,
                                    color: GlobalVariable.primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
