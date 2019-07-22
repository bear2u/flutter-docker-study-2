import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({this.title});

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Text('a'),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Text('b'),
                  ),
                  flex: 8,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
