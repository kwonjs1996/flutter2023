import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.photo_camera,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body:
          // 성능최적화가 되어있다 미리 그려놓지 않고 스크롤을 내릴 때 맞춰서 로드한다.
          ListView.builder(
        itemBuilder: (context, index) {
          return Feed();
        },
        itemCount: 10,
      ),
    );
  }
}
