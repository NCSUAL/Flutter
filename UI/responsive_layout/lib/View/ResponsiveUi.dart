import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 반응형 폰트 위젯
Widget responsive_Font(BuildContext context,double fontsize,FontWeight fontWeight,Color? color, Alignment? alignment,String text) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double fontSize = constraints.maxWidth * fontsize; // 최대 너비의 5%를 폰트 크기로 사용
      return Container(
        alignment: alignment?? Alignment.center,
        width: constraints.maxWidth,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize, // 동적 폰트 크기
            fontWeight: fontWeight,
            color: color,
          ),
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}