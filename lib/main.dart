import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quizu/screens/app/app.dart';
import 'package:quizu/utilities/providers_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'repository/token_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //get token then check it
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  bool? introStatus = prefs.getBool("intro") ?? true;

  bool tokenStatus = token != null
      ? await TokenRepository().tokenVerification(token) == 200
      : false;

  runApp(MultiProvider(
      providers: ProvidersList.providersList(),
      child: App(
        token: token,
        tokenStatus: tokenStatus,
        introStatus: introStatus,
      )));
}
