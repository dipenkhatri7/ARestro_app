import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PasswordSuccess extends StatelessWidget {
  static const String routeName = '/passwordSuccess';
  const PasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            scale: 4.5,
            image: AssetImage('assets/images/top.png'),
            alignment: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Logos.png'),
                    height: 108,
                    width: 108,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const Text(
                    'Password Changed',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  const Text(
                    'Your password has been reset successfully.',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        letterSpacing: 0.55),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  CustomButtom(
                    text: 'Back to Login',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/signIn', (route) => false);
                    },
                    color: GlobalVariable.primaryColor,
                    textColor: Colors.white,
                    round: 5,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bottom.png'),
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
