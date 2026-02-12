import 'package:flutter/material.dart';

class Member2App extends StatefulWidget {
  const Member2App({super.key});

  @override
  State<Member2App> createState() => _Member2AppState();
}

class _Member2AppState extends State<Member2App> {
  final TextEditingController scoreController = TextEditingController();
  String gradeResult = "";

  void calculateGrade() {
    double score = double.tryParse(scoreController.text) ?? 0;

    setState(() {
      if (score >= 80) {
        gradeResult = "A";
      } else if (score >= 70) {
        gradeResult = "B";
      } else if (score >= 60) {
        gradeResult = "C";
      } else if (score >= 50) {
        gradeResult = "D";
      } else {
        gradeResult = "F";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Member 2 - Grade Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("กรอกคะแนน (0-100)", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: scoreController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ใส่คะแนน",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateGrade,
              child: const Text("คำนวณเกรด"),
            ),
            const SizedBox(height: 20),
            Text(
              "เกรด: $gradeResult",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
