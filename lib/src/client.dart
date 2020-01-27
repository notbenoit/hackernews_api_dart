import 'package:http/http.dart' as http;
import 'types/item_id.dart';
import 'types/item.dart';
import 'route.dart';
import 'dart:convert';

class Client {
  final Version version;
  Client(this.version);

  static const String apiURL = 'https://hacker-news.firebaseio.com/';

  String get root => Client.apiURL + 'v' + version.version.toString() + '/';
  
  /// Builds a future that will fetch data at the given [Route]
  Future<T> run<T>(Route<T> route) async {
    final url = this.root + route.route;
    print("Fetching $url");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return route.parse(jsonData);
    } else {
      throw Exception('Load failed');
    }
  }

  /// Builds a stream that will pull all the [Item]s for a given list
  /// of [ItemID]s
  Stream<Item> itemsForIds(List<ItemID> itemIds) {
    final futures = itemIds.map((itemId) => this.run(Route.item(itemId)));
    return Stream.fromFutures(futures);
  }
}

class Version {
  final int version;
  Version(this.version);
}
