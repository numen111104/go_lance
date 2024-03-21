import 'package:go_lance/entitles/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Item {
  int id;
  String name;
  bool isPickedUp;
  bool isUrgent;
  String description;
  String pickupTime;
  String location;
  String imageUrl;

  ToOne<User> customer = ToOne<User>();
  ToOne<User> driver = ToOne<User>();

  Item(
      {this.id = 0,
      required this.name,
      this.isPickedUp = false,
      this.isUrgent = false,
      required this.description,
      required this.pickupTime,
      required this.location,
      required this.imageUrl,
      required this.customer,
      required this.driver});
}

enum PatientState { dead, emergency, elderly, home, threat, minorInjury }
