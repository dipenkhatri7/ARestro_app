import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/auth/widgets/input_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgotPassword';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Logos.png'),
                    height: 108,
                    width: 108,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const Text(
                    'Don’t worry! It happens. Please enter the email associated with your account.',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        letterSpacing: 0.55),
                  ),
                  InputField(
                    hint: 'example@gmail.com',
                    controller: _emailController,
                    isEmail: true,
                    icon: const Icon(
                      Icons.email_outlined,
                    ),
                    text: "Email",
                    isPassword: false,
                  ),
                  CustomButtom(
                    text: 'Send Code',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/resetPassword', (route) => false);
                    },
                    color: GlobalVariable.primaryColor,
                    textColor: Colors.white,
                    round: 5,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Remember Password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Manrope',
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/signIn', (route) => false);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Manrope',
                      fontSize: 15,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
