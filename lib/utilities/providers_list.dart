import 'package:provider/provider.dart';
import '../provider/auth.dart';
import '../provider/leaderboard_provider.dart';
import '../provider/quiz_provider.dart';
import '../provider/user_provider.dart';

class ProvidersList {
  static providersList() {
    return [
      ChangeNotifierProvider<Auth>(create: (context) => Auth()),
      ChangeNotifierProxyProvider<Auth, UserProvider>(
          create: (context) => UserProvider(),
          update: (_, auth, user) => user!..updateUserData(auth.token)),
      ChangeNotifierProxyProvider<Auth, LeaderboardProvider>(
          create: (context) => LeaderboardProvider(),
          update: (_, auth, user) =>
              user!..updateLeaderboardProvider(auth.token)),
      ChangeNotifierProxyProvider<Auth, QuizProvider>(
          create: (context) => QuizProvider(),
          update: (_, auth, user) => user!..updateQuizProvider(auth.token)),
    ];
  }
}
