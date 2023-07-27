import 'package:flutter/material.dart';

/// Miso 메인 색상
Color misoPrimaryColor = Color.fromARGB(255, 38, 103, 240);

class Miso extends StatefulWidget {
  const Miso({Key? key}) : super(key: key);

  @override
  _MisoState createState() => _MisoState();
}

class _MisoState extends State<Miso> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          MisoFirstPage(),
          MisoSecondPage(),
          MisoThirdPage(),
          MisoFourthPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          print("selected newIndex : $newIndex");
          // 다른 페이지로 이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: misoPrimaryColor, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

/// 첫 번째 페이지
class MisoFirstPage extends StatelessWidget {
  const MisoFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: misoPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Text(
              '대한민국 1등 홈서비스\n  미소를 만나보세요!',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 40),
            child: TextButton(
              style: TextButton.styleFrom(
                  // fixedSize: Size(120, 60),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                  primary: misoPrimaryColor),
              onPressed: () {},
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add),
                Text(
                  '예약하기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: misoPrimaryColor,
                  ),
                ),
              ]),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent, elevation: 0),
            child: Text(
              '서비스 상세정보',
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}

/// 두 번째 페이지
class MisoSecondPage extends StatelessWidget {
  const MisoSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Text(
              '예약내역',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.error,
                    size: 20,
                    color: misoPrimaryColor,
                  ),
                  hintText: "예약된 서비스가 아직 없어요. 지금 예약해보세요!",
                  hintStyle: TextStyle(fontSize: 13)),
            ),
          ),
          Spacer(),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: misoPrimaryColor,
              ),
              onPressed: () {},
              child: Text(
                '예약하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

/// 세 번째 페이지
class MisoThirdPage extends StatelessWidget {
  const MisoThirdPage({Key? key}) : super(key: key);

  /// 세 번째 화면 배경 이미지 URL
  final String backgroundImgUrl =
      "https://i.ibb.co/rxzkRTD/146201680-e1b73b36-aa1e-4c2e-8a3a-974c2e06fa9d.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: misoPrimaryColor,
              child: Column(
                children: [
                  // 한줄텍스트에 다른 스타일 적용하고싶을 때
                  Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: misoPrimaryColor,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: '친구 추천할 때마다\n',
                          ),
                          TextSpan(
                            text: '10,000원 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextSpan(text: '할인쿠폰 지급!'),
                          // RichText(
                          //     text: TextSpan(children: [
                          //   TextSpan(text: 'Hello '),
                          //   TextSpan(
                          //       text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                          //   TextSpan(text: ' world!'),
                          // ]))
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '자세히 보기',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              '$backgroundImgUrl',
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          '친구 추천하기',
          style:
              TextStyle(color: misoPrimaryColor, fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          Icons.redeem,
          color: misoPrimaryColor,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

/// 네 번째 페이지
class MisoFourthPage extends StatelessWidget {
  const MisoFourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: [
                Text(
                  '나의 정보',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Text('010-9999-9999'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      width: 20,
                    ),
                    Text('주소관리')
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(
                      width: 20,
                    ),
                    Text('결제 수단 관리')
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.campaign),
                    SizedBox(
                      width: 20,
                    ),
                    Text('공지사항')
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.question_mark_rounded),
                    SizedBox(
                      width: 20,
                    ),
                    Text('문의사항')
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
