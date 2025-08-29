import 'package:commerce_20250828/screen/home/home_widgets.dart';
import 'package:flutter/material.dart';

import '../../asset_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    AssetPath.cloth1,
    AssetPath.cloth2,
    AssetPath.cloth3,
    AssetPath.cloth4,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              children: [
                ...List.generate(imageList.length, (index) {
                  return Image.asset(imageList[index], fit: BoxFit.cover);
                }),
              ],
            ),
          ),
          SizedBox(height: 24,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageList.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: currentIndex == index ? 20 : 10, // 선택되면 20, 아니면 10
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == index ? Colors.grey : Colors.grey.shade300,  // 값이 낮을 수록 흐린 색
                ),
              );
            }),
          ),

          SizedBox(height: 24,),

          HomeWidgets.shortcut(iconList :[
            AssetPath.jacket,
            AssetPath.jumper,
            AssetPath.necklace,
            AssetPath.bag,
            AssetPath.cap,
            AssetPath.skirt,
            AssetPath.trousers,
            AssetPath.shirt,
          ])

        ],
      ),
    );
  }
}
