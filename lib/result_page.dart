import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {super.key,
      required int this.result,
      required int this.startNum,
      required int this.endNum});

  int? result;
  int? startNum;
  int? endNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'The result of the sum of all the numbers between ${startNum} and ${endNum} is:'),
            ),
            Text(
              '$result',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
