import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/details/screens/dishDetails.dart';
import 'package:flutter/material.dart';

class BestDishes extends StatefulWidget {
  final List<String> listDishes;
  const BestDishes({super.key, required this.listDishes});

  @override
  State<BestDishes> createState() => _BestDishesState();
}

class _BestDishesState extends State<BestDishes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (String dish in widget.listDishes)
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.348,
              height: MediaQuery.of(context).size.height * 0.285,
              color: Colors.transparent,
              // color: Colors.blue,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => const DishDetail());
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 60, bottom: 30),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: GlobalVariable.primaryColor
                                .withOpacity(0.09845),
                            offset: Offset(1, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dish,
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 18,
                                    letterSpacing: 0.8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Veg Burger',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Rs. 200',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.8,
                                    color: GlobalVariable.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, 2),
                              blurRadius: 10,
                              spreadRadius: -5.85,
                            ),
                          ],
                        ),
                        child: Transform.scale(
                          scale: 1.1845,
                          child: Image(
                            image: AssetImage(
                              'assets/images/burger.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
    // builder: (BuildContext context, ScrollController scrollController) {
    //   return Container(
    //     color: Colors.blueGrey,
    //     child: ListView.builder(
    //       controller: scrollController,
    //       itemCount: 50,
    //       itemBuilder: (BuildContext context, int index) {
    //         return ListTile(title: Text('Item $index'));
    //       },
    //     ),
    //   );
    // },
  }
}
