import 'package:commerce_20250828/model/product_model.dart';
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

  List<ProductModel> newProductList = [
    ProductModel(AssetPath.productJacketJean, "청자켓", 90000, 31, 4.3, false),
    ProductModel(AssetPath.productManJacket, "남자 자켓", 85000, 83, 4.1, false),
    ProductModel(
      AssetPath.productManStreet,
      "남자 스트릿 자켓",
      89000,
      41,
      4.7,
      false,
    ),
    ProductModel(AssetPath.productManSuit, "남자 수트", 100000, 40, 4.5, false),
    ProductModel(AssetPath.productShoes, "신발", 45000, 21, 3.5, false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageList.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 10,
                width: currentIndex == index ? 20 : 10,
                // 선택되면 20, 아니면 10
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == index
                      ? Colors.grey
                      : Colors.grey.shade300, // 값이 낮을 수록 흐린 색
                ),
              );
            }),
          ),

          SizedBox(height: 24),

          HomeWidgets.shortcut(
            iconList: [
              AssetPath.jacket,
              AssetPath.jumper,
              AssetPath.necklace,
              AssetPath.bag,
              AssetPath.cap,
              AssetPath.skirt,
              AssetPath.trousers,
              AssetPath.shirt,
            ],
          ),

          SizedBox(height: 24),
          HomeWidgets.subTitle("신제품"),
          HomeWidgets.productHorizontal(newProductList),

          /// 이벤트 항목 추가
          /// subTitle 위젯 사용
          /// Image.asset 위젯 사용
          /// AssetPath.event 사용
          SizedBox(height: 24),
          HomeWidgets.subTitle("이벤트"),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(AssetPath.event, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
