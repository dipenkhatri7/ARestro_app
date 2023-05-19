import 'dart:convert';
import 'package:arestro_app/Utils/customSnackbar.dart';
import 'package:arestro_app/Utils/errorHandler.dart';
import 'package:arestro_app/constants/constant.dart';
import 'package:arestro_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required num phoneNumber,
  }) async {
    try {
      debugPrint('Registering User');
      User user = User(
        email: email,
        name: name,
        password: password,
        phoneNumber: phoneNumber,
        // id: '',
        token: '',
      );
      debugPrint('Here User: ${user.toJson()}');
      http.Response res = await http.post(
        Uri.parse('$url/api/v1/user/auth/register'),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint('Response: ${res.body}');
      errorHandler(
        onSucess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              backgroundColor: GlobalVariable.primaryColor,
              text: 'User Registered Successfully',
            ).getSnackBar(),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, '/BottomNavigation', (route) => false);
        },
        context: context,
        response: res,
      );
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
              text: err.toString(), backgroundColor: GlobalVariable.cancelColor)
          .getSnackBar());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      debugPrint("email: $email, password: $password");
      http.Response res = await http.post(
        Uri.parse('$url/api/v1/user/auth/login'),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint("Response: ${res.body}");
      errorHandler(
        context: context,
        onSucess: () async {
          final prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString('token');
          if (token == null) {
            prefs.setString('token', jsonDecode(res.body)['token']);
          }
          Navigator.pushNamedAndRemoveUntil(
              context, '/BottomNavigation', (route) => false);
        },
        response: res,
      );
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
              text: err.toString(), backgroundColor: GlobalVariable.cancelColor)
          .getSnackBar());
    }
  }
}
