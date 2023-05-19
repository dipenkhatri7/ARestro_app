import 'package:arestro_app/features/auth/screens/forgotpassword.dart';
import 'package:arestro_app/features/auth/screens/resetPassword.dart';
import 'package:arestro_app/features/auth/screens/signIn.dart';
import 'package:arestro_app/features/auth/screens/signUp.dart';
import 'package:arestro_app/features/cart/screens/cart.dart';
import 'package:arestro_app/features/home/screens/bottomNavigation.dart';
import 'package:arestro_app/features/home/screens/dashboard.dart';
import 'package:arestro_app/features/home/screens/restaurantsNear.dart';
import 'package:arestro_app/features/maps/screens/mapScreen.dart';
import 'package:arestro_app/features/notifications/screens/notifications.dart';
import 'package:arestro_app/features/pages/screens/orderCompleted.dart';
import 'package:arestro_app/features/pages/screens/passwordSuccess.dart';

import 'package:arestro_app/features/search/screens/search.dart';
import 'package:arestro_app/features/settings/screens/profile.dart';
import 'package:arestro_app/features/settings/screens/settings.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // case AuthPage.routeName:
    //   return MaterialPageRoute(builder: (_) => AuthPage());
    case SignUp.routeName:
      return MaterialPageRoute(builder: (_) => SignUp());
    case SignIn.routeName:
      return MaterialPageRoute(builder: (_) => SignIn());
    case BottomNavigation.routeName:
      return MaterialPageRoute(builder: (_) => BottomNavigation());
    case Dashboard.routeName:
      return MaterialPageRoute(builder: (_) => Dashboard());
    case Cart.routeName:
      return MaterialPageRoute(builder: (_) => Cart());
    case Search.routeName:
      return MaterialPageRoute(builder: (_) => Search());
    case Settings.routeName:
      return MaterialPageRoute(builder: (_) => Settings());
    case Profile.routeName:
      return MaterialPageRoute(builder: (_) => Profile());
    case Notifications.routeName:
      return MaterialPageRoute(builder: (_) => Notifications());
    case ForgotPassword.routeName:
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    case ResetPassword.routeName:
      return MaterialPageRoute(builder: (_) => ResetPassword());
    case PasswordSuccess.routeName:
      return MaterialPageRoute(builder: (_) => PasswordSuccess());
    case OrderComplete.routeName:
      return MaterialPageRoute(builder: (_) => OrderComplete());
    // case Dishes.routeName:
    //   return MaterialPageRoute(builder: (_) => Dishes());
    case ResetPassword.routeName:
      return MaterialPageRoute(builder: (_) => RestaurantsNearby());
    case Maps.routeName:
      return MaterialPageRoute(builder: (_) => Maps());

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("This Screen Doesn't exist"),
          ),
        ),
      );
  }
}
