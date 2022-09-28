import '../models/top_scores.dart';
import '../service/networking/api_base_helper.dart';

class TopScoresRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<TopScores>> getTopScores(String authorization) async {
    final response =
        await _helper.get("TopScores", authorization: authorization);
    return (response as List).map((p) => TopScores.fromJson(p)).toList();
  }
}
