import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DishDetail extends StatefulWidget {
  const DishDetail({super.key});

  @override
  State<DishDetail> createState() => DishDetailState();
}

class DishDetailState extends State<DishDetail> {
  Widget makeDismissible({required Widget child}) => GestureDetector(
        onTap: () => Navigator.pop(context),
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: Colors.transparent,
          child: child,
        ),
      );
  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 88,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
  Widget ingridients() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients:',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18,
            letterSpacing: 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "• Chicker\n• Cheese\n• Tomato\n• Onion\n• Lettuce",
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }

  Widget nutrientsFacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Calories',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              '20g',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Protein',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              '10g',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fat',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              '10g',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Carbs',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              '10g',
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
    );
  }

  bool isFavourite = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            controller: controller,
            children: [
              buildDragHandle(),
              Image(
                image: AssetImage(
                  'assets/images/burger.png',
                ),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomButtom(
                    text: "View in ARestro mode",
                    onPressed: () {},
                    color: Colors.red.withOpacity(0.8),
                    textColor: Colors.white,
                    round: 8,
                    size: 0.5,
                    textSize: 12,
                    height: 35.485,
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon: Icon(
                        isFavourite ? Icons.pin_drop : Icons.pin_drop_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon: Icon(
                        isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.black,
                      ),
                    ),
                  )
                  // CustomButtom(
                  //   text: 'Favourite',
                  //   onPressed: () {
                  //     setState(() {
                  //       isFavourite = !isFavourite;
                  //     });
                  //     // if (isFavourite) {
                  //     //   ScaffoldMessenger.of(context).showSnackBar(
                  //     //     const SnackBar(
                  //     //       content: Text('Added to Favourite'),
                  //     //     ),
                  //     //   );
                  //     // } else {
                  //     //   ScaffoldMessenger.of(context).showSnackBar(
                  //     //     const SnackBar(
                  //     //       content: Text('Removed from Favourite'),
                  //     //     ),
                  //     //   );
                  //     // }
                  //   },
                  //   color: GlobalVariable.primaryColor,
                  //   textColor: Colors.white,
                  //   round: 5,
                  //   size: 0.13,
                  //   isfavorite: isFavourite,
                  //   height: 35.485,
                  // ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Chicken Burger',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 28,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$ 12.00",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        letterSpacing: 0.8,
                        color: GlobalVariable.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
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
                    initialRating: 4.5,
                    minRating: 1,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    allowHalfRating: true,
                    unratedColor: Colors.grey,
                    itemSize: 14.85,
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    "- 4.5",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      letterSpacing: 0.8,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: GlobalVariable.primaryColor,
                  ),
                  const Text(
                    '2000+ Orders',
                    style: TextStyle(
                      fontSize: 14.45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      heroTag: 'btn1',
                      onPressed: () {
                        setState(() {
                          if (quantity == 0) {
                            quantity = 1;
                          } else if (quantity > 1) quantity--;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      backgroundColor: GlobalVariable.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 45,
                    height: 35,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$quantity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      heroTag: 'btn2',
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: GlobalVariable.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  CustomButtom(
                    text: 'Add To Cart',
                    onPressed: () {},
                    color: GlobalVariable.primaryColor,
                    textColor: Colors.white,
                    round: 5,
                    size: 0.28,
                    textSize: 12,
                    height: 30,
                  )
                ],
              ),
              const Divider(),
              const Text(
                'Description:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ingridients(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nutrition Facts:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              nutrientsFacts(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Reviews:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
