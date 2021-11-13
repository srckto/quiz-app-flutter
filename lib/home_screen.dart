import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropdownValue;
  List<String> _list = [
    "General Knowledge",
    "Entertainment: Books",
    "Entertainment: Film",
    "Entertainment: Television",
    "Entertainment: Video Games",
    "Science & Nature",
    "Science: Computers",
    "Mythology",
    "Sports",
    "Geography",
    "History",
    "Politics",
    "Celebrities",
    "Animals",
    "Vehicles",
    "Entertainment: Comics",
    "Entertainment: Japanese Anime & Manga",
    "Entertainment: Cartoon & Animations",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quiz App",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 30),
              _dropDownButton(),
              SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      primary: Color(0xFFFFBA00),
                    ),
                    onPressed: () {
                      if (dropdownValue == null)
                        Get.snackbar("Error", "Please choose any type");
                      else
                        Get.to(() => QuizScreen(dropdownValue: dropdownValue!));
                    },
                    child: Text(
                      "PLAY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDownButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.15),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: DropdownButton(
        value: dropdownValue == null ? null : dropdownValue,
        focusColor: Colors.white,
        borderRadius: BorderRadius.circular(20),
        underline: Container(),
        hint: Text(
          "Please choose a type",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: _list
            .map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(element),
                ))
            .toList(),
      ),
    );
  }
}
