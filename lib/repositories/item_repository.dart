import 'package:go_lance/entitles/item.dart';
import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/objectbox.g.dart';

class ItemRepository {
  final Store store;
  ItemRepository({required this.store});

  int addOrUpdateItem(Item item) {
    return store.box<Item>().put(item);
  }

  Stream<Query<Item>> getQueryStream(Condition<Item>? condition) {
    return store.box<Item>().query(condition).watch(triggerImmediately: true);
  }

  int requestItem({required Item item, required User user}) {
    item.driver.target = user;
    return addOrUpdateItem(item);
  }

  int pickUpItem({required Item item}) {
    if (item.driver.target != null) {
      item.isPickedUp = true;
      return addOrUpdateItem(item);
    }
    return 0;
  }
}
