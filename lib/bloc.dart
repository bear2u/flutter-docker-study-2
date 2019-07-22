import 'package:listview/repository.dart';
import 'package:rxdart/rxdart.dart';

import 'item.dart';

class Bloc {
  final _repository = Repository();
  // Input
  final _items = PublishSubject<List<Item>>();

  // Output
  Stream<List<Item>> get items => _items.stream;

  fetchItems() async {
    
    final list = await _repository.fetchItems();
    _items.sink.add(list);
    // Future.delayed(Duration(milliseconds: 100), () {
    //   _items.sink.add(list);
    // });    
  }

  dispose() {
    _items.close();
  }
}