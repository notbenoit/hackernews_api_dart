import 'dart:math';

import 'package:test/test.dart';
import 'package:hackernews/hackernews.dart';

void main() {
  Client client;
  
  setUpAll(() {
    final version = Version(0);
    client = Client(version);
  });
  
  test('top stories', () async {
    final route = Route.topStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('best stories', () async {
    final route = Route.bestStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('new stories', () async {
    final route = Route.newStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('ask stories', () async {
    final route = Route.askStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('show stories', () async {
    final route = Route.showStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('job stories', () async {
    final route = Route.askStories();
    final items = await client.run(route);
    print("Got ${items.length.toString()} items");
    expect(items.length, greaterThan(0));
  });

  test('fetch item', () async {
    final route = Route.item(ItemID(8863));
    final item = await client.run(route);
    print("Got ${item.toString()}");
    print("Of type ${item.type.toString()}");
    expect(item.id.identifier, equals(ItemID(8863).identifier));
  });

  test('fetch user', () async {
    final route = Route.user("jl");
    final user = await client.run(route);
    print("Got ${user.toString()}");
    print("User has ${user.submitted.length.toString()} posts");
    expect(user.id, equals("jl"));
  });

  test('fetch list of items', () async {
    final route = Route.newStories();
    final items = await client.run(route);
    final countToFetch = Random().nextInt(min(40, items.length));
    print("Got ${items.length.toString()} items");
    print("Fetching $countToFetch items");
    final stream = client.itemsForIds(items.sublist(0, countToFetch)).asBroadcastStream();
    stream.listen((item) => print(item.date.toString()));
    final count = await stream.length;
    expect(count, equals(countToFetch));
  });
}
