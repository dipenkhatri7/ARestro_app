import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/auth/widgets/input_field.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = '/resetPassword';
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isSamePassword = false;
  @override
  void initState() {
    super.initState();
    _confirmPasswordController.addListener(() {
      setState(() {
        _isSamePassword =
            (_passwordController.text == _confirmPasswordController.text);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
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
                    'Reset Password',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const Text(
                    'Please type something you’ll remember',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        letterSpacing: 0.55),
                  ),
                  InputField(
                    hint: 'Enter Your Password',
                    controller: _passwordController,
                    isEmail: false,
                    icon: Icon(Icons.lock_outline),
                    text: "Password",
                    isPassword: true,
                  ),
                  Builder(builder: (context) {
                    return InputField(
                      hint: 'Confirm Your Password',
                      controller: _confirmPasswordController,
                      isEmail: false,
                      icon: Icon(Icons.lock_outline),
                      text: "",
                      isPassword: true,
                      isSamePassword: _isSamePassword,
                    );
                  }),
                  CustomButtom(
                    text: 'Reset Password',
                    onPressed: () {
                      if (_isSamePassword) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/passwordSuccess', (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password does not match'),
                          ),
                        );
                      }
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
