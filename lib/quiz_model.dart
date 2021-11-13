class QuizModel {
  late int response_code;
  late List<Results> results = [];
  QuizModel({
    required this.response_code,
    required this.results,
  });

  QuizModel.fromJson(jsonData) {
    response_code = jsonData["response_code"];
    jsonData["results"].forEach((element) {
      results.add(Results.fromJson(element));
    });
    // results = jsonData["results"] as List<Results>;
  }
}

class Results {
  late String category;
  late String type;
  late String difficulty;
  late String question;
  late String correct_answer;
  late List<String> incorrect_answers = [];

  Results.fromJson(jsonData) {
    category = jsonData["category"];
    type = jsonData["type"];
    difficulty = jsonData["difficulty"];
    question = jsonData["question"];
    correct_answer = jsonData["correct_answer"];
    jsonData["incorrect_answers"].forEach((element) {
      incorrect_answers.add(element);
    });
    incorrect_answers.add(correct_answer);
    incorrect_answers.shuffle();
  }
}
