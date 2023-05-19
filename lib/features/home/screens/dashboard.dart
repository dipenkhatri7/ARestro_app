import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/home/screens/bestOffers.dart';
import 'package:arestro_app/features/home/widgets/searchButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String getCurrentMonth() {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('MMMM').format(now);
    return currentMonth;
  }

  List<String> restaurants = [
    'Restaurant 1',
    'Restaurant 2',
    'Restaurant 3',
    'Restaurant 4',
    'Restaurant 5',
    'Restaurant 6',
  ];
  final List<String> images = [
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
  ];
  List<Color> dotColors = [
    Color.fromRGBO(0, 0, 0, 0.9),
    Color.fromRGBO(0, 0, 0, 0.4),
  ];

  String currentMonth = '';
  String special = 'Burger';
  int _current = 0;
  final TextEditingController _searchController = TextEditingController();
  double _rating = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentMonth = getCurrentMonth();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          currentMonth = getCurrentMonth();
        });
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double itemWidth = constraints.maxWidth;
                    return CarouselSlider.builder(
                      itemCount: images.length,
                      options: CarouselOptions(
                        aspectRatio: 16 / 8,
                        viewportFraction: itemWidth / constraints.maxWidth,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        // height: MediaQuery.of(context).size.height * 0.21,
                      ),
                      itemBuilder: (BuildContext context, int index, _) {
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 12.8, top: 13, bottom: 13),
                              height: MediaQuery.of(context).size.height * 0.21,
                              width: itemWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff004422),
                                    Color(0xffD9FFEC),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Special Offer for $currentMonth",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Manrope',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.98,
                                    ),
                                  ),
                                  Text(
                                    "We are here with the\nBest $special in town.\nHurry up! \nOffer ends soon",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Manrope',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  CustomButtom(
                                    text: 'Buy Now',
                                    onPressed: () {},
                                    color: Colors.white,
                                    textColor: Colors.black,
                                    round: 5,
                                    size: 0.2285,
                                    height: 0.074,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.298,
                              top: MediaQuery.of(context).size.height * 0.03585,
                              child: Image.asset(images[index],
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width *
                                      0.6585),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < images.length; i++)
                      Container(
                        width: _current == i ? 10.0 : 8.0,
                        height: _current == i ? 10.0 : 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == i ? dotColors[0] : dotColors[1],
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SearchButton(
                  searchController: _searchController,
                  height: 38,
                  prefix: Icon(
                    Icons.search_outlined,
                    color: Color(0xff000000).withOpacity(0.74),
                  ),
                  postfix: Icon(
                    Icons.mic_outlined,
                    color: Color(0xff000000).withOpacity(0.74),
                  ),
                  hintText: "Search for dishes, restaurants, cuisines, ...",
                ),
                const SizedBox(
                  height: 10,
                ),
                BestOffers(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Restaurants Nearby',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.98,
                      ),
                    ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (String res in restaurants)
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width * 0.38,
                          color: Colors.transparent,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/Restaurant.png',
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    res,
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating: _rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        unratedColor: Colors.grey,
                                        itemSize: 18.85,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Color(0xffFEAD1D),
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            _rating = rating;
                                            debugPrint(_rating.toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        " - $_rating",
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BestOffers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 // Stack(
              //   // alignment: Alignment.topRight,
              //   children: [
              //     Container(
              //       padding:
              //           const EdgeInsets.only(left: 12.8, top: 3, bottom: 3),
              //       height: 150,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8),
              //         gradient: const LinearGradient(
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //           colors: [
              //             Color(0xff004422),
              //             Color(0xffD9FFEC),
              //           ],
              //         ),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             "Special Offer\nfor $currentMonth",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontFamily: 'Manrope',
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold,
              //               letterSpacing: 0.98,
              //             ),
              //           ),
              //           Text(
              //             "We are here with the\nBest $special in town",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontFamily: 'Manrope',
              //               fontSize: 11,
              //               fontWeight: FontWeight.w600,
              //               letterSpacing: 0.8,
              //             ),
              //           ),
              //           CustomButtom(
              //             text: 'Buy Now',
              //             onPressed: () {},
              //             color: Colors.white,
              //             textColor: Colors.black,
              //             round: 5,
              //             size: 0.2285,
              //             height: 0.074,
              //           )
              //         ],
              //       ),
              //     ),
              //     Positioned(
              //       right: -70,
              //       top: -50,
              //       child: Image.asset(
              //         'assets/images/burger.png',
              //         width: 280,
              //         height: 280,
              //       ),
              //     ),
              //   ],
              // ),