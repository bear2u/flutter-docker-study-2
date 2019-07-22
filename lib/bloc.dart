import 'package:rxdart/rxdart.dart';

import 'item.dart';

class Bloc {
  // Input
  final _items = PublishSubject<Item>();

  // Output
  get items => _items.stream;

  fetchItems() {
    for(var i = 0;i<20;i++) {
      Item item = Item(
        title: 'title$i',
        content: 'content$i',        
      );
      _items.sink.add(item);
    }    
  }

  dispose() {
    _items.close();
  }
}