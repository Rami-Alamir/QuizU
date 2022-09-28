import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/quiz_provider.dart';
import '../../widgets/quiz/choice.dart';
import '../../widgets/quiz/timer.dart';
import '../../widgets/shared/retry.dart';
import '../../widgets/shared/spinkit_indicator.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  @override
  void initState() {
    final QuizProvider quizProvider =
        Provider.of<QuizProvider>(context, listen: false);
    quizProvider.getQuestions(this, context);
    super.initState();
  }

  @override
  void dispose() {
    try {
      final QuizProvider quizProvider =
          Provider.of<QuizProvider>(context, listen: false);
      quizProvider.controller.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final QuizProvider quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      body: quizProvider.isLoading
          ? const SpinkitIndicator()
          : quizProvider.retry
              ? Retry(onPressed: () {
                  quizProvider.setIsLoading = true;
                  quizProvider.getQuestions(this, context);
                })
              : ListView(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 90),
                  children: [
                    LinearTimer(
                      value: quizProvider.controller.value,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Questions ${quizProvider.currentIndex + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: " / ${quizProvider.questionsList.length}",
                              style: Theme.of(context).textTheme.headline4,
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: SizedBox(
                        height: 120,
                        child: Text(
                          quizProvider.questionsList[quizProvider.currentIndex]
                              .question!,
                          style: Theme.of(context).textTheme.headline1!,
                        ),
                      ),
                    ),
                    Choice(
                      title: quizProvider
                          .questionsList[quizProvider.currentIndex].a!,
                      onTap: () => quizProvider.checkAnswer(context, "a"),
                    ),
                    Choice(
                      title: quizProvider
                          .questionsList[quizProvider.currentIndex].b!,
                      onTap: () => quizProvider.checkAnswer(context, "b"),
                    ),
                    Choice(
                      title: quizProvider
                          .questionsList[quizProvider.currentIndex].c!,
                      onTap: () => quizProvider.checkAnswer(context, "c"),
                    ),
                    Choice(
                      title: quizProvider
                          .questionsList[quizProvider.currentIndex].d!,
                      onTap: () => quizProvider.checkAnswer(context, "d"),
                    ),
                    Visibility(
                      visible: quizProvider.canSkip,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                        child: TextButton(
                          onPressed: () {
                            quizProvider.skipQuestion();
                          },
                          child: Text(
                            "Skip",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
