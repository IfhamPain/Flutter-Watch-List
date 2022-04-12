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
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
    Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  ];
}

List<Symbols> symList = [
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
  Symbols(symCode: "AAA", price: Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00),
];

class Symbols {
  String symCode;
  double price;

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
            backgroundColor: Color(0xFFFFFFFF),
            title: Center(
              child: Text("UA MOB Flutter", style: TextStyle(color: Colors.black),
              ),
            ),
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
      child: const TabBar(
        tabs: [
          Tab(
            child: Text(
              'Watch 1',
                style: TextStyle(
                  color: Colors.black,
                ),
            ),
          ),
          Tab(
            child: Text(
              'Watch 2',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget watchList() {
    Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      setState(() {
        refreshSymbols();
      });
    });
    return GridView.builder(
      itemCount: symList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 1.5,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Container(
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
