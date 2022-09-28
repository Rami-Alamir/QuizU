import '../models/questions.dart';
import '../service/networking/api_base_helper.dart';

class QuestionsRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Questions>> getQuestions(String authorization) async {
    final response =
        await _helper.get("Questions", authorization: authorization);
    return (response as List).map((p) => Questions.fromJson(p)).toList();
  }
}
