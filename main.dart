import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:collection';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAMOB Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

refreshSymbols () {
  symList = [
    Symbols(symCode: "AAA", price: Random().nextInt(100)),
    Symbols(symCode: "BBB", price: Random().nextInt(100)),
    Symbols(symCode: "CCC", price: Random().nextInt(100)),
    Symbols(symCode: "DDD", price: Random().nextInt(100)),
    Symbols(symCode: "EEE", price: Random().nextInt(100)),
    Symbols(symCode: "FFF", price: Random().nextInt(100)),
    Symbols(symCode: "GGG", price: Random().nextInt(100)),
    Symbols(symCode: "HHH", price: Random().nextInt(100)),
    Symbols(symCode: "III", price: Random().nextInt(100)),
    Symbols(symCode: "JJJ", price: Random().nextInt(100)),
  ];
}

int randomNumGenerator() {
  int value = 0;
  Timer.periodic(const Duration(milliseconds: 1000), (timer) {
    value = Random().nextInt(100);
  });
  return value;
}

List<Symbols> symList = [
  Symbols(symCode: "AAA", price: Random().nextInt(100)),
  Symbols(symCode: "BBB", price: Random().nextInt(100)),
  Symbols(symCode: "CCC", price: Random().nextInt(100)),
  Symbols(symCode: "DDD", price: Random().nextInt(100)),
  Symbols(symCode: "EEE", price: Random().nextInt(100)),
  Symbols(symCode: "FFF", price: Random().nextInt(100)),
  Symbols(symCode: "GGG", price: Random().nextInt(100)),
  Symbols(symCode: "HHH", price: Random().nextInt(100)),
  Symbols(symCode: "III", price: Random().nextInt(100)),
  Symbols(symCode: "JJJ", price: Random().nextInt(100)),
];

class Symbols {
  String symCode;
  int price;

  Symbols({required this.symCode, required this.price});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      // Do whatever you want based on the tab index
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            title: Text("UA MOB Flutter"),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: watchList()),
              Container(child: watchList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: const TabBar(
        tabs: [
          Tab(
            text: "Watch 1",
          ),
          Tab(
            text: "Watch 2",
          ),
        ],
      ),
    );
  }

  Widget watchList() {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        refreshSymbols();
      });
    });
    return GridView.builder(
      itemCount: symList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridView.count(
          crossAxisCount: 1,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                      Text(symList[index].symCode),
                      Text(symList[index].price.toString()),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
