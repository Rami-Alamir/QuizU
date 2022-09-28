import 'package:flutter/material.dart';

import '../models/top_scores.dart';
import '../repository/top_scores_repository.dart';

class LeaderboardProvider with ChangeNotifier {
  List<TopScores> _topScoresList = [];
  String? _token;
  bool _isLoading = true;
  bool _retry = false;

  bool get isLoading => _isLoading;
  bool get retry => _retry;

  List<TopScores> get topScoresList => _topScoresList;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //used when auth provider changed then update token
  void updateLeaderboardProvider(String? token) {
    _token = token;
    if (_token == null) {
      _topScoresList.clear();
    } else if (_token != null && _topScoresList.isEmpty) {
      getTopScores();
    }
  }

  // get getTopScores list
  Future<void> getTopScores({bool isLoading = true}) async {
    _isLoading = isLoading;
    _retry = false;
    try {
      _topScoresList =
          await TopScoresRepository().getTopScores("Bearer $_token");
      _topScoresList.sort((a, b) => b.score!.compareTo(a.score!));
    } catch (_) {
      _retry = true;
    }
    _isLoading = false;
    notifyListeners();
  }
}
