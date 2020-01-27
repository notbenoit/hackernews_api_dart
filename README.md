# HackerNews

A Dart package to interact with the HackerNews API.

## Usage

This library expects you to use a `Client` to interact with the HackerNews API. This `Client` can `run` any `Route` to get back a `Future`.
There are a set of predefined `Route`s, but more can be added in an extension.

```dart
import 'package:hackernews/hackernews.dart';

final version = Version(0);
final client = Client(version);
final route = Route.bestStories();
final items = await client.run(route);
print("Got ${items.length.toString()} best stories");
```

The predefined [Route]()s are :

```dart
static Route<List<ItemID>> topStories()
static Route<List<ItemID>> newStories()
static Route<List<ItemID>> bestStories()
static Route<List<ItemID>> askStories()
static Route<List<ItemID>> showStories()
static Route<List<ItemID>> jobStories()
static Route<Item> item(ItemID)
static Route<User> user(String)
```

## Note
This is a very barebone implementation, and still a pre-release one. The intention is to use this library as a way to learn dart, and going further, flutter.