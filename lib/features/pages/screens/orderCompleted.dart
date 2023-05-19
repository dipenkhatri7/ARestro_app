import 'dart:ui';
import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/auth/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderComplete extends StatefulWidget {
  static const String routeName = '/orderComplete';
  const OrderComplete({Key? key});

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.8, sigmaY: 01.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(
              //   flex: 1,
              // ),
              // Image(
              //   image: AssetImage(
              //     'assets/images/Appbar.png',
              //   ),
              //   fit: BoxFit.cover,
              //   height: 50,
              // ),
              const Spacer(
                flex: 4,
              ),
              CircleAvatar(
                backgroundColor: GlobalVariable.primaryColor,
                radius: 44,
                child: Icon(
                  Icons.done,
                  size: 54,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                    letterSpacing: 1.2,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Thank you!\n',
                    ),
                    TextSpan(
                      text: 'Order Completed',
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              const Text(
                'Please rate your experience',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  letterSpacing: 0.55,
                  color: Colors.black,
                ),
              ),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: true,
                glowColor: Colors.amber,
                glowRadius: 5,
                updateOnDrag: true,
                unratedColor: Colors.grey,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
              InputField(
                hint: 'Leave Feedback',
                controller: _feedbackController,
                isEmail: false,
                icon: Icon(Icons.edit),
                text: "",
                isPassword: false,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomButtom(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/BottomNavigation', (route) => false);
                      },
                      color: GlobalVariable.primaryColor,
                      textColor: Colors.white,
                      round: 5,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomButtom(
                      text: 'Skip',
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/BottomNavigation', (route) => false);
                      },
                      color: Colors.white,
                      textColor: GlobalVariable.primaryColor,
                      round: 5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
