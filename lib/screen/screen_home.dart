import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class Product {
  final String img;
  final String title;
  final String nic;
  final int price;
  final int msg;
  final int favorite;

  Product.fromMap(Map<String, dynamic> map)
      : img = map['img'],
        title = map['title'],
        nic = map['nic'],
        price = map['price'],
        favorite = map['favorite'],
        msg = map['msg'];

  @override
  String toString() => "Product<$img:$title>";
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _product = [
      Product.fromMap({
        'img': 'assets/product.png',
        'title': '상품제목을쓰는데띄아쓰지않고잘쓰면어ㄸ허게되는지모보아나습니다',
        'nic': '닉네임임',
        'price': 2000,
        'msg': 0,
        'favorite': 1,
      }),
      Product.fromMap({
        'img': 'assets/po1.jpeg',
        'title': '상품제목을 씁니다',
        'nic': 'edkdkfjsdli',
        'price': 50000,
        'msg': 2,
        'favorite': 0
      })
    ];

    double width = MediaQuery.of(context).size.width;
    var f = NumberFormat('###,###,###,###');

    return Scrollbar(
      child: ListView.separated(
        padding: EdgeInsets.all(15),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: _product.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.infinity,
            height: width * 0.25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: width * 0.25,
                  child: Image.asset(
                    _product[index].img,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _product[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              _product[index].nic,
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${f.format(_product[index].price)}원',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ButtonBar(
                          children: [
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: null,
                              icon: Icon(
                                Boxicons.bx_message_rounded,
                                size: 16,
                                color: Colors.grey,
                              ),
                              label: Text(
                                '${_product[index].msg}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  letterSpacing: -10,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: null,
                              icon: Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: Colors.grey,
                              ),
                              label: Text(
                                '${_product[index].favorite}',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    letterSpacing: -10),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
