import 'package:flutter/material.dart';
import 'package:flutter_demo/Network/http_request.dart';
import 'package:flutter_demo/Network/http_config.dart';
import 'Model/home_model.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  late final home_model _homeModel;

  // late final TabController _tabController;
  // List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpRequest.request(BASEURL).then((value) {
      setState(() {
        _homeModel = value;
        // _tabController = TabController(length: _homeModel.result.data.length, vsync: this);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final list_data = _homeModel.result.data;
    List tabs = ["头条", "历史", "图片"];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: tabs.map((e) => Text(e)).toList(),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontSize: 20),),
        ),
        body: TabBarView(children: tabs.map((e) {
          return KeepAlive(
            keepAlive: true,
            child: ListView.builder(
                itemCount: list_data.length,
                itemExtent: 100.0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(list_data[index].title),

                    ],
                  );
                }
            ),
          );
        }).toList()),
      ),
    );
  }

}




