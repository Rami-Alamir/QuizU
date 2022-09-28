import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';
import '../../utilities/app_theme.dart';
import '../../utilities/route_generator.dart';

class App extends StatefulWidget {
  final String? token;
  final bool? tokenStatus;
  const App({Key? key, this.token, this.tokenStatus = false}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    final Auth auth = Provider.of<Auth>(context, listen: false);
    auth.setToken = widget.token;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: widget.tokenStatus! ? '/Home' : '/Login',
    );
  }
}
