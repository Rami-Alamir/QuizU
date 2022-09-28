import 'package:flutter/material.dart';
import 'package:quizu/screens/login/login.dart';
import '../screens/home/home.dart';
import '../screens/login/username.dart';
import '../screens/login/verify_otp.dart';
import '../screens/quiz/quiz.dart';
import '../screens/quiz/result.dart';
import '../screens/quiz/try_again.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/Login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/Username':
        return MaterialPageRoute(builder: (_) => const Username());
      case '/VerifyOtp':
        return MaterialPageRoute(builder: (_) => const VerifyOtp());
      case '/Home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/Quiz':
        return MaterialPageRoute(builder: (_) => const Quiz());
      case '/Result':
        return MaterialPageRoute(builder: (_) => const Result());
      case '/TryAgain':
        return MaterialPageRoute(builder: (_) => const TryAgain());
      default:
        return null;
    }
  }
}
