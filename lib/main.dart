import 'package:flutter/material.dart';
import 'package:listview/provider.dart';

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
      home: Provider(
        child: MyHomePage(title: 'Flutter Demo Home Page')
      ),
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
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(2.0),
            height: 100.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image.asset("assets/images/item1.png"),
                  flex: 3,
                ),
                Expanded(
                  child: Container(                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('title'),
                        Text('content'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              child: Text('button1'),
                            ),
                            RaisedButton(
                              child: Text('button2'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 7,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
