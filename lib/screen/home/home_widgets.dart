// import 'package:flutter/cupertino.dart';
import 'package:commerce_20250828/model/product_model.dart';
import 'package:flutter/material.dart';

class HomeWidgets {
  static Widget shortcut({required List<String> iconList}) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // 현재 scrollview 안에 들어갈 거니까 스크롤 안되게
      children: List.generate(iconList.length, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                maximumSize: Size(80, 80),
                padding: EdgeInsets.all(16),
                elevation: 0,
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.purple,
              ),
              child: Image.asset(iconList[index], fit: BoxFit.cover),
            ),
          ],
        );
      }),
    );
  }

  static Widget subTitle(String title) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Product 모델 5개로 만들기
  /// ListView.builder에 가로 padding 16 추가
  static Widget productHorizontal(List<ProductModel> dataList) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var productModel = dataList[index];

          /// index = 0, 1, 2, 3, 4
          /// dataList.length = 5
          bool lastIndex = index == dataList.length -1; // index = 마지막 인덱스값이면 true, 아니면 false 반환
          return Container(
            width: 150,
            margin: EdgeInsets.only(right: lastIndex ? 0 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  productModel.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 4),
                Text(
                  productModel.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text("${productModel.price}원"), // 패키지로 콤마 추가 가능
                Text("${productModel.reviewRating}(${productModel.reviewCount})"),

              ],
            ),
          );
        },
      ),
    );
  }
}

/// ListView.builder 가로 스크롤 위젯 추가
/// Column
/// 데이터 모델 추가 ProdctModel
/// String image, String name, int price, int reviewCount, double reviewRating, bool cart
