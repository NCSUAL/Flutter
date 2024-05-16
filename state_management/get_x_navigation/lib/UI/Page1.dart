import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Get.arguments,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("이전 페이지로 돌아가기"),
              onPressed: () {
                Get.back(); //이전 페이지로 이동
              },
            ),
          ],
        ),
      ),
    );
  }
}
