import 'package:flutter/material.dart';
import 'package:listview/provider.dart';

import 'item.dart';

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
    final bloc = Provider.of(context);    
    bloc.fetchItems();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Item>>(
        stream: bloc.items,
        builder: (context, snapshot) {
          final list = snapshot.data ?? [];
          print('list => $list, snapshot state => ${snapshot.connectionState}');
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
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
                            Text(item.title),
                            Text(item.content),
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
          );
        }
      ),
    );
  }
}
