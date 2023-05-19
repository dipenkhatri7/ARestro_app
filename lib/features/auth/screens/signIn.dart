import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/services/LocalAuth.dart';
import 'package:arestro_app/features/auth/services/authServices.dart';
import 'package:arestro_app/features/auth/widgets/checkbox.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/auth/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class SignIn extends StatefulWidget {
  static const String routeName = '/signIn';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool? _value = true;
  AuthServices authService = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isAuthenticated = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('assets/images/Logos.png'),
                  height: 108,
                  width: 108,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Log In',
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
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
                    const SizedBox(
                      height: 10,
                    ),
                    InputField(
                      hint: 'Enter Your Password',
                      controller: _passwordController,
                      isEmail: false,
                      icon: const Icon(Icons.lock_outline),
                      text: "Password",
                      isPassword: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomCheckbox(
                          value: _value,
                          isResponsive: true,
                          color: Colors.green,
                          onSuccess: (bool? value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontFamily: 'Manrope',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotPassword');
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            letterSpacing: 1.2,
                            color: GlobalVariable.cancelColor,
                            fontFamily: 'Manrope',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomButtom(
                        text: 'Login',
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          print('Login');
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            await authService.signInUser(
                              context: context,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                          print('Login');
                          // final prefs = await SharedPreferences.getInstance();
                          // prefs.setBool('isLogin', true);
                          setState(() {
                            isLoading = false;
                          });
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
                      flex: 1,
                      child: CustomButtom(
                        text: 'Fingerprint',
                        onPressed: () async {
                          final authenticate = await LocalAuth.authenticate();
                          setState(() {
                            isAuthenticated = authenticate;
                          });
                          List<BiometricType> avai =
                              await LocalAuth.getAvailableBiometrics();
                          debugPrint(avai.toString());
                          if (isAuthenticated) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/BottomNavigation', (route) => false);
                          }
                        },
                        color: GlobalVariable.primaryColor,
                        textColor: Colors.white,
                        round: 5,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "or continue with",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                CustomButtom(
                  image: const AssetImage('assets/images/google.png'),
                  text: 'Login With Google',
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.black,
                  round: 5,
                ),
                CustomButtom(
                  image: const AssetImage('assets/images/apple.png'),
                  text: 'Login With Apple',
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.black,
                  round: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
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
                            context, '/signUp', (route) => false);
                      },
                      child: const Text(
                        'Sign Up',
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
        ),
        Visibility(
          visible: isLoading,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
