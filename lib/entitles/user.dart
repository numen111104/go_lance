import 'package:go_lance/entitles/item.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class User {
  int id;
  String name;
  @Backlink("customer")
  ToMany<Item> givenItems = ToMany<Item>();
  @Backlink("driver")
  ToMany<Item> receivedItems = ToMany<Item>();
  User({this.id = 0, required this.name});
}
