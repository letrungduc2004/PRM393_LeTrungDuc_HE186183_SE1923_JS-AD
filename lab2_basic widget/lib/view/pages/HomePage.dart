import 'package:flutter/material.dart';
import 'package:day3/view/widgets/MyButtonBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blue,
        // leading: là thành phần hiển thị ở bên trái của AppBar
        // IconButton là một widgets cho phép bạn tạo một nút có biểu tượng, thường được sử dụng trong AppBar để tạo các nút điều hướng hoặc hành động.
        leading: IconButton(onPressed: onPress, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: onPress, icon: Icon(Icons.search)),
          IconButton(onPressed: onPress, icon: Icon(Icons.more_vert)),
        ],
      ),

      // SafeArea: là một widgets giúp nội dung không bị che khuất bởi các phần tử hệ thống như notch, status bar, hoặc navigation bar.
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset("assets/images/BTapDich.jpg", fit: BoxFit.cover)),
      bottomNavigationBar: const MyButtonBar(),
    );
  }
}