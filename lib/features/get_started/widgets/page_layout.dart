import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page_Layout extends StatelessWidget {
  final String illustration;
  final String title;
  final String subtitle;
  const Page_Layout(
      {super.key,
      required this.illustration,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(illustration),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
                letterSpacing: 1),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 0.8,
              fontFamily: 'Manrope',
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}