import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_test/result_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int startNum = 0;
  int endNum = 0;

  Widget buildTexts() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: 'Type a number'),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                startNum = int.parse(value);
              });
            }
          },
          keyboardType: TextInputType.number,
        ),
        TextField(
          decoration: const InputDecoration(hintText: 'Type a number'),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ], //
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                endNum = int.parse(value);
              });
            }
          },
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  int addNumbersInBetween() {
    int sum = 0;

    if (startNum > endNum) {
      int temp = startNum;
      setState(() {
        startNum = endNum;
        endNum = temp;
      });
    }

    for (int i = startNum; i <= endNum; i++) {
      sum += i;
    }

    return sum;
  }

  void submit() {
    addNumbersInBetween();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: addNumbersInBetween(),
            startNum: startNum,
            endNum: endNum,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTexts(),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: submit, child: const Text('SUBMIT'))
          ],
        ),
      ),
    );
  }
}
