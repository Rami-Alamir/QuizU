import 'dart:async';

import 'package:flutter/material.dart';
import '../models/questions.dart';
import '../repository/questions_repository.dart';
import '../repository/user_repository.dart';

class QuizProvider with ChangeNotifier {
  List<Questions> _questionsList = [];
  String? _token;
  bool _isLoading = true;
  bool _retry = false;
  bool _canSkip = true;
  late int _score;

  int _currentIndex = 0;
  late AnimationController controller;
  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;
  bool get retry => _retry;

  int get score => _score;

  bool get canSkip => _canSkip;

  List<Questions> get questionsList => _questionsList;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void updateQuizProvider(String? token) {
    _token = token;
  }

  // get getQuestions list
  Future<void> getQuestions(TickerProvider tickerProvider, BuildContext context,
      {bool isLoading = true}) async {
    _isLoading = isLoading;
    _currentIndex = 0;
    _canSkip = true;
    _retry = false;
    try {
      _questionsList =
          await QuestionsRepository().getQuestions("Bearer $_token");
    } catch (_) {
      _retry = true;
    }
    _isLoading = false;
    notifyListeners();
    // ignore: use_build_context_synchronously
    startTimer(context, tickerProvider);
  }

  Future<bool> postingUserScore() async {
    try {
      await UserRepository()
          .postingUserScore("Bearer $_token", {"score": "$_score"});
    } catch (_) {}
    return false;
  }

  void startTimer(BuildContext context, TickerProvider tickerProvider) {
    controller = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 120),
    )..addListener(() {
        notifyListeners();
        if (controller.status == AnimationStatus.completed) {
          controller.stop();
          controller.removeListener(() {});
          _score = _currentIndex + (_canSkip ? 1 : 0) - 1;
          Navigator.of(context).pushReplacementNamed("/Result");
        }
      });
    controller.forward();
  }

  void checkAnswer(BuildContext context, String answer) {
    _score = _currentIndex + (_canSkip ? 1 : 0) - 1;
    if (questionsList[_currentIndex].correct == answer) {
      _currentIndex += 1;
      notifyListeners();
    } else if ((currentIndex + 1) == questionsList.length) {
      controller.stop();
      controller.removeListener(() {});
      Navigator.of(context).pushReplacementNamed("/Result");
    } else {
      controller.stop();
      controller.removeListener(() {});
      Navigator.of(context).pushReplacementNamed("/TryAgain");
    }
  }

  void skipQuestion() {
    _currentIndex += 1;
    _canSkip = false;
    notifyListeners();
  }
}
