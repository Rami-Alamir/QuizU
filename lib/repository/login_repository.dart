import '../service/networking/api_base_helper.dart';

class LoginRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> login(Map<String, dynamic> body) async {
    final response = await _helper.post("Login", body);
    return response;
  }
}
