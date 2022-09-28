import 'package:quizu/models/user_data.dart';
import '../service/networking/api_base_helper.dart';

class UserRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<int> postingUsername(
      String authorization, Map<String, dynamic> body) async {
    final int statusCode =
        await _helper.post2("Name", body, authorization: authorization);
    return statusCode;
  }

  Future<int> postingUserScore(
      String authorization, Map<String, dynamic> body) async {
    int statusCode = 404;
    try {
      statusCode =
          await _helper.post2("Score", body, authorization: authorization);
    } catch (_) {}
    return statusCode;
  }

  Future<UserData> getUserData(String authorization) async {
    final response =
        await _helper.get("UserInfo", authorization: authorization);
    UserData? user;
    try {
      user = UserData.fromJson(response);
    } catch (_) {}
    return user!;
  }
}
