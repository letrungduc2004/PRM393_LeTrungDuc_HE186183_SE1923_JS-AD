import 'package:day3/view/pages/HomePage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// có 2 loại Widget: StatelessWidget: trong suốt quá trình chạy giao diện không đổi
// StatefulWidget:  Có thể thay đổi trạng thái, giao diện trong quá trình chạy
class MyApp extends StatelessWidget {
  // Mỗi widgets đều có một hàm build để xây dựng giao diện
  // Mỗi widgets đều có một thuộc tính key để xác định widgets đó

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Thuộc tính home: nó sẽ hiển thị giao diện đầu tiên khi chạy ứng dụng
      // Scaffold: là khung ứng dụng cơ bản, nó cung cấp các thành phần như AppBar(navbar), Body(thân),..
      home: HomePage(),
    );
  }
}

// body: SafeArea(
// child: Center(
// child: RichText(
// text: TextSpan(
// text: "Hello chúng mày", style: TextStyle(color : Colors.yellow, fontSize: 50),
// children:[
// TextSpan(text: "Hello", style: TextStyle(color : Colors.red, fontSize: 30)),
// ]
// ),
// ),
// ),
// ),