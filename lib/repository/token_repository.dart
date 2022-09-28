import '../service/networking/api_base_helper.dart';

class TokenRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<int> tokenVerification(String authorization) async {
    final int statusCode =
        await _helper.get3("Token", authorization: authorization);
    return statusCode;
  }
}
