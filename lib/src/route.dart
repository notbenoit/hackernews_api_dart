import 'types/item_id.dart';
import 'types/item.dart';
import 'types/user.dart';

class Route<T> {
  final String route;
  final T Function(dynamic) parse;
  Route(this.route, this.parse);

  static Route<List<ItemID>> topStories() => Route._stories('topstories');
  static Route<List<ItemID>> newStories() => Route._stories('newstories');
  static Route<List<ItemID>> bestStories() => Route._stories('beststories');
  static Route<List<ItemID>> askStories() => Route._stories('askstories');
  static Route<List<ItemID>> showStories() => Route._stories('showstories');
  static Route<List<ItemID>> jobStories() => Route._stories('jobstories');

  static Route<Item> item(ItemID id) {
    return Route(
      "item/${id.identifier}.json", 
      (json) => Item.fromJSON(json)
    );
  }

  static Route<User> user(String id) {
    return Route(
      "user/$id.json", 
      (json) => User.fromJSON(json)
    );
  }

  static Route<List<ItemID>> _stories(String path) {
    return Route(
      "$path.json", 
      (json) => (json as List).map((json) => ItemID.fromJSON(json)).toList()
    );
  }
}