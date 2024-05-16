import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_navigation/UI/Page1.dart';

void main() {
  runApp(GetMaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Page1());
                },
                child: Text("다음 페이지로 이동하기")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.off(() => Page1());
                  print("안녕");
                },
                child: Text("지금 페이지 삭제하고 넘어가기")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(() => Page1());
                },
                child: Text("지금까지 쌓인 페이지 다 삭제하고 넘어가기"))
          ],
        ),
      ),
    );
  }
}
