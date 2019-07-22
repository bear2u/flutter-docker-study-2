import 'package:rxdart/rxdart.dart';

import 'item.dart';

class Bloc {
  // Input
  final _items = PublishSubject<List<Item>>();

  // Output
  Stream<List<Item>> get items => _items.stream;

  fetchItems() {
    List<Item> list = [];
    for(var i = 0;i<20;i++) {
      Item item = Item(
        title: 'title$i',
        content: 'content$i',        
      );
      list.add(item);
    }    
    print('item list : $list');
    _items.sink.add(list);
  }

  dispose() {
    _items.close();
  }
}