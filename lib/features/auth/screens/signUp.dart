import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/features/auth/services/authServices.dart';
import 'package:arestro_app/features/auth/widgets/custom_button.dart';
import 'package:arestro_app/features/auth/widgets/input_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signUp';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthServices authService = AuthServices();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
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

  String countryCode = '+977';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                'Create an Account',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CountryCodePicker(
                              padding: EdgeInsets.zero,
                              showFlagMain: true,
                              flagWidth: 30,
                              showFlag: true,
                              //item builder
                              showDropDownButton: true,
                              onChanged: (value) {
                                setState(() {
                                  countryCode = value.dialCode!;
                                  print(countryCode);
                                });
                              },
                              initialSelection: 'NP',
                              favorite: const ['+977', 'NP'],
                              textStyle: TextStyle(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                prefixIconColor: Colors.grey,
                                hintStyle: TextStyle(
                                  color: Color(0xff9C9C9C),
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    InputField(
                      hint: 'Enter your Full Name',
                      controller: _fullNameController,
                      isEmail: false,
                      icon: const Icon(
                        Icons.abc_outlined,
                      ),
                      text: "",
                      isPassword: false,
                    ),
                    InputField(
                      hint: 'Enter your email',
                      controller: _emailController,
                      isEmail: true,
                      icon: const Icon(
                        Icons.email_outlined,
                      ),
                      text: "",
                      isPassword: false,
                    ),
                    InputField(
                      hint: 'Enter Your Password',
                      controller: _passwordController,
                      isEmail: false,
                      icon: const Icon(Icons.lock_outline),
                      text: "",
                      isPassword: true,
                    ),
                    Builder(builder: (context) {
                      return InputField(
                        hint: 'Confirm Your Password',
                        controller: _confirmPasswordController,
                        isEmail: false,
                        icon: const Icon(Icons.lock_outline),
                        text: "",
                        isPassword: true,
                        isSamePassword: _isSamePassword,
                      );
                    }),
                  ],
                ),
              ),
              CustomButtom(
                text: 'Sign Up',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    debugPrint("Form is Valid");
                    if (_isSamePassword) {
                      debugPrint("Password is same");
                      _phoneNumberController.text =
                          countryCode + _phoneNumberController.text;
                      await authService.signUpUser(
                        context: context,
                        name: _fullNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        phoneNumber: int.parse(_phoneNumberController.text),
                      );
                    }
                  }
                },
                color: GlobalVariable.primaryColor,
                textColor: Colors.white,
                round: 5,
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
                text: 'Signup With Google',
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.black,
                round: 5,
              ),
              CustomButtom(
                image: const AssetImage('assets/images/apple.png'),
                text: 'Signup With Apple',
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.black,
                round: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
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
      ),
    );
  }
}
