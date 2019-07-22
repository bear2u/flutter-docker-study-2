import 'api.dart';
import 'item.dart';

class Repository {
  // fetch items
  List<Source> sources = [
    Api()
  ];

  Future<List<Item>> fetchItems() {
    return sources[0].fetchItems();
  }
}

abstract class Source {
  // fetch Items
  Future<List<Item>> fetchItems();
}