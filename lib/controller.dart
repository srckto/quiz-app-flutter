import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'quiz_model.dart';

class QuizController extends GetxController {
  int currentIndex = 0;
  late QuizModel quizHelper;
  bool state = false;
  int result = 0;

  fetchData(String dropdownValue) async {
    state = true;
    update();

    late int countOfCategory;
    if (dropdownValue == "General Knowledge")
      countOfCategory = 9;
    else if (dropdownValue == "Entertainment: Books")
      countOfCategory = 10;
    else if (dropdownValue == "Entertainment: Film")
      countOfCategory = 11;
    else if (dropdownValue == "Entertainment: Television")
      countOfCategory = 14;
    else if (dropdownValue == "Entertainment: Video Games")
      countOfCategory = 15;
    else if (dropdownValue == "Science & Nature")
      countOfCategory = 17;
    else if (dropdownValue == "Science: Computers")
      countOfCategory = 18;
    else if (dropdownValue == "Mythology")
      countOfCategory = 20;
    else if (dropdownValue == "Sports")
      countOfCategory = 21;
    else if (dropdownValue == "Geography")
      countOfCategory = 22;
    else if (dropdownValue == "History")
      countOfCategory = 23;
    else if (dropdownValue == "Politics")
      countOfCategory = 24;
    else if (dropdownValue == "Celebrities")
      countOfCategory = 26;
    else if (dropdownValue == "Animals")
      countOfCategory = 27;
    else if (dropdownValue == "Vehicles")
      countOfCategory = 28;
    else if (dropdownValue == "Entertainment: Comics")
      countOfCategory = 29;
    else if (dropdownValue == "Entertainment: Japanese Anime & Manga")
      countOfCategory = 31;
    else if (dropdownValue == "Entertainment: Cartoon & Animations")
      countOfCategory = 32;
    else
      countOfCategory = 18;
    String api =
        "https://opentdb.com/api.php?amount=15&category=$countOfCategory&difficulty=medium&type=multiple";
    http.Response res = await http.get(Uri.parse(api));

    quizHelper = QuizModel.fromJson(jsonDecode(res.body));

    state = false;
    update();
  }

  onChoose(String choose) {
    if (choose == quizHelper.results[currentIndex].correct_answer) result++;
    currentIndex++;
    update();
  }
}
