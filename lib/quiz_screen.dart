import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/controller.dart';
import 'package:quiz_app/result_screen.dart';

class QuizScreen extends StatelessWidget {
  final String dropdownValue;
  QuizScreen({Key? key, required this.dropdownValue}) : super(key: key);

  final QuizController _controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    _controller.fetchData(dropdownValue);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: GetBuilder<QuizController>(
          builder: (_) => _controller.state
              ? Center(
                  child: CircularProgressIndicator(
                  color: Color(0xFFFFBA00),
                ))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          _controller.quizHelper.results[_controller.currentIndex].question,
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 60),
                        Column(
                          children: _controller
                              .quizHelper.results[_controller.currentIndex].incorrect_answers
                              .map(
                                (element) => SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        primary: Color(0xFFFFBA00),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                      ),
                                      onPressed: () {
                                        _controller.onChoose(element);

                                        if (_controller.currentIndex == 14)
                                          Get.off(
                                            () => ResultScreen(
                                                result: _controller.result,
                                                length: _controller.quizHelper.results.length),
                                          );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          element,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
