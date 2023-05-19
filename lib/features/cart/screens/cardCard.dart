import 'package:arestro_app/constants/constant.dart';
import 'package:flutter/material.dart';

class CardCard extends StatefulWidget {
  final int price;

  const CardCard({
    required this.price,
    super.key,
  });

  @override
  State<CardCard> createState() => _CardCardState();
}

class _CardCardState extends State<CardCard> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/images/burger.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chicken Burger',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Order No: 1234567890',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Rs. ${quantity * widget.price}',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: GlobalVariable.primaryColor,
                    letterSpacing: 1.2,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Container(
                  width: 23.45,
                  height: 23.45,
                  child: FloatingActionButton(
                    heroTag: 'btn1',
                    onPressed: () {
                      setState(() {
                        if (quantity == 0) {}
                        if (quantity > 1) quantity--;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                    ),
                    backgroundColor: GlobalVariable.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 40,
                  height: 30,
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
                        fontSize: 16,
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
                  width: 23.45,
                  height: 23.45,
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
                      size: 20,
                    ),
                    backgroundColor: GlobalVariable.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
