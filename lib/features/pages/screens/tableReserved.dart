import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class TableReserved extends StatefulWidget {
  const TableReserved({super.key});

  @override
  State<TableReserved> createState() => _TableReservedState();
}

class _TableReservedState extends State<TableReserved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/Pattern.png'),
                  fit: BoxFit.cover,
                  // alignment: Alignment.topCenter,
                  // fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/tableReserved.png',
                      ),
                      scale: 3.45,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        letterSpacing: 0.8,
                        color: GlobalVariable.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Your Table was!\n',
                        ),
                        TextSpan(
                          text: 'Reserved Successfully!',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        letterSpacing: 0.4,
                        color: Color(0xff747474),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Please respect our policies and do come to !\n',
                        ),
                        TextSpan(
                          text:
                              'your reserved Table within the specified* time!',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 14,
                  ),
                  CustomButtom(
                    text: 'Order Food',
                    onPressed: () {},
                    color: GlobalVariable.primaryColor,
                    textColor: Colors.white,
                    round: 5,
                  ),
                  const Spacer(
                    flex: 2,
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //   },
                  //   child: const Text('Continue'),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.green,
                  //     onPrimary: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(32.0),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
