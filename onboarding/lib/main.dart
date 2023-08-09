import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

//전역변수
//late 변수 안에 무조건 값을 할당한 이후 사용할 때 사용 null 이 들어갈 수 있다면 ?사용할것
late SharedPreferences prefs;

void main() async {
  // main() 함수에서 async를 쓰려면 필요
  WidgetsFlutterBinding.ensureInitialized();

  // shared_preferences 인스턴스 생성
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sharedpreferences에서 온보딩 완료 여부 조회
    // isOnboarded에 해당하는 값에서 null을 반환하는 경우 false 할당.
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 앱 전체 폰트를 바꾸고 싶을 때 사용
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme("Yeon Sung"),
      ),
      home: isOnboarded ? HomePage() : OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          // 첫 번째 페이지
          PageViewModel(
            title: "빠른 개발",
            body: "Flutter의 hot reload는 쉽고 UI 빌드를 도와줍니다.",
            image: Padding(
              padding: EdgeInsets.all(32),
              child: Image.network(
                  'https://user-images.githubusercontent.com/26322627/143761841-ba5c8fa6-af01-4740-81b8-b8ff23d40253.png'),
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          // 두 번째 페이지
          PageViewModel(
            title: "표현력 있고 유연한 UI",
            body: "Flutter에 내장된 아름다운 위젯들로 사용자를 기쁘게 하세요.",
            image: Image.network(
                'https://user-images.githubusercontent.com/26322627/143762620-8cc627ce-62b5-426b-bc81-a8f578e8549c.png'),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
        next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          // Done 클릭시 inOnboarede = true로 저장
          prefs.setBool("isOnboarded", true);

          //Done 클릭시 페이지 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}

//done 버튼 클릭시 나오는 페이지
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // SharedPreferences에 저장된 모든 데이터 삭제
              prefs.setBool("isBoarded", false);
              // prefs.clear();
            },
            icon: Icon(Icons.delete),
          ),
        ],
        title: Text('Home Page!'),
      ),
      body: Center(
        child: Text(
          "환영합니다!",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
