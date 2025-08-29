import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidgets {
  static Widget shortcut({required List<String> iconList}) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // 현재 scrollview 안에 들어갈 거니까 스크롤 안되게
      children: List.generate(iconList.length, (index) {
        return ElevatedButton(
          onPressed: () {},
          child: Image.asset(iconList[index], fit: BoxFit.cover),
        );
      }),
    );
  }
}
