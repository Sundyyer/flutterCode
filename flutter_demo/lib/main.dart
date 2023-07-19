import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Demo',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是标题"),
      ),
      body: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final textEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
        textEditController.text = "hello world";
    textEditController.addListener(() {
      print("textEditController:${textEditController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: "userName",
        hintText: "请输入用户名",
        border: InputBorder.none,
      ),
      //事件监听
      onChanged: (value) {
        print("onChanged：$value");
      },
      //键盘的提交按钮
      onSubmitted: (value) {
        print("onSubmitted:$value");
      },
    );
  }
}

