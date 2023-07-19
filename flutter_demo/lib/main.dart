import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Demo',
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
      body: contentWidget(),
    );
  }
}




/// 继承自statefulWidget必须写state，因为在state去维护状态的变化
/// 整块内容的widget
class contentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _contentState();
  }
}
/// 这里用下划线的原因是因为在dart中私有化一个属性是用下划线
class _contentState extends State<contentWidget> {
  @override
  Widget build(BuildContext context) {
    return loginWidget();
  }
}

/// 登录的widget
class loginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loginState();
  }
}

class _loginState extends State<loginWidget> {

  final registerFormkey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  void saveRegisterForm() {

    if (username.length == 0 || username == "") {
      print("当前输入的用户名为空$username");
      return;
    }

    if (password.length == 0 || password == "") {
      print("当前输入的密码为空$password");
      return;
    }


    registerFormkey.currentState?.save();
    registerFormkey.currentState?.validate();
    print("当前输入用户名是:$username, 密码是:$password");

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          child: Column( //child:这里只能存放一个textField
            key: registerFormkey,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ //children:这里就可以存放多个textField

              TextFormField( //用户名的textField
                decoration: const InputDecoration( //这里存放着textField中的icon
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名或手机号码",
                ),
                onChanged: (value) {
                  this.username = value ?? "";
                  print("$value");
                },
              ),

              SizedBox(height: 20,),

              TextFormField( //密码的TextField
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "请输入密码",
                  suffixIcon: ImageIcon(image)
                ),
                onChanged: (value) {
                  this.password = value ?? "";
                  print("$value");
                },
              ),

              SizedBox(height: 20,),

              Container(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(onPressed: saveRegisterForm,
                  child: Text("注册",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
            ],
      )),
    );
  }
}

