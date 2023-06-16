import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Feed.dart';

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
      body: Feed(),
    );
  }
}
