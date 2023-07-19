import 'package:flutter/material.dart';
import 'package:flutter_demo/Network/http_request.dart';
import 'package:flutter_demo/Network/http_config.dart';
import 'Model/home_model.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeBoby(),
    );
  }
}

class HomeBoby extends StatefulWidget {
  const HomeBoby({super.key});

  @override
  State<HomeBoby> createState() => _HomeBobyState();
}

class _HomeBobyState extends State<HomeBoby> {

  late home_model _homeModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     HttpRequest.request(BASEURL).then((value) {
       // final data = value.data["data"];
       setState(() {
         _homeModel = value;
       });

     });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _homeModel.result.data.length,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.network(_homeModel.result.data[index].thumbnailPicS, width: 50,),
          title: Text(_homeModel.result.data[index].title),
        );
      }),
    );
  }
}
