import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/objectbox.g.dart';

class ItemRepository{
  final Store store;
  ItemRepository({required this.store});

  int addOrUpdateItem(Item item) {
    return store.box<Item>().put(item);
  }
  Stream<Query<Item>> getQueryStream(Condition<Item>? condition) {
    return store.box<Item>().query(condition).watch(triggerImmediately: true);
  }
}