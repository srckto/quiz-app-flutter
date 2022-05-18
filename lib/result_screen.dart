import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int result;
  final int length;
  const ResultScreen({Key? key, required this.result, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Result",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "$result / ${length}",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Color(0xFFFFBA00),
                    ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      primary: Color(0xFFFFBA00),
                    ),
                    onPressed: () => Get.off(() => HomeScreen()),
                    child: Text(
                      "RESTART",
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
}
