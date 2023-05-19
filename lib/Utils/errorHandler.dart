import 'dart:convert';

import 'package:arestro_app/Utils/customSnackbar.dart';
import 'package:arestro_app/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void errorHandler({
  required BuildContext context,
  required VoidCallback onSucess,
  required http.Response response,
}) {
  switch (response.statusCode) {
    case 200:
      onSucess();
      break;
    case 201:
      onSucess();
      break;
    // case 400:
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     CustomSnackBar(
    //       backgroundColor: GlobalVariable.cancelColor,
    //       text: response.body.toString(),
    //     ).getSnackBar(),
    //   );
    //   break;
    // case 401:
    //   ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
    //     backgroundColor: GlobalVariable.cancelColor,
    //     text: 'Unauthorized',
    //   ).getSnackBar());
    //   break;
    // case 403:
    //   ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
    //     backgroundColor: GlobalVariable.cancelColor,
    //     text: 'Forbidden',
    //   ).getSnackBar());
    //   break;
    // case 404:
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     CustomSnackBar(
    //             backgroundColor: GlobalVariable.cancelColor, text: 'Not Found')
    //         .getSnackBar(),
    //   );
    //   break;
    // case 500:
    //   ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
    //     backgroundColor: GlobalVariable.cancelColor,
    //     text: 'Internal Server Error',
    //   ).getSnackBar());
    //   break;
    // case 502:
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     CustomSnackBar(
    //       backgroundColor: GlobalVariable.cancelColor,
    //       text: 'Bad Gateway',
    //     ).getSnackBar(),
    //   );
    //   break;
    // case 503:
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     CustomSnackBar(
    //       backgroundColor: GlobalVariable.cancelColor,
    //       text: 'Service Unavailable',
    //     ).getSnackBar(),
    //   );
    //   break;
    // case 504:
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     CustomSnackBar(
    //       backgroundColor: GlobalVariable.cancelColor,
    //       text: 'Gateway Timeout',
    //     ).getSnackBar(),
    //   );
    //   break;
    default:
      final responseMap = jsonDecode(response.body);
      final message = responseMap['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          text: message,
          backgroundColor: GlobalVariable.cancelColor,
        ).getSnackBar(),
      );
  }
}
