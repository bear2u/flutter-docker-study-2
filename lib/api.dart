import 'package:listview/repository.dart';

import 'item.dart';

class Api implements Source {
  @override
  Future<List<Item>> fetchItems() {  
    List<Item> list = [];
    for(var i = 0;i<20;i++) {
      Item item = Item(
        title: 'title$i',
        content: 'content$i',        
      );
      list.add(item);
    }      
    return Future.value(list);
  }
}