import 'item.dart';
import 'item_id.dart';

class Story extends Item {
  final String title;
  final String text;
  final int descendants;
  final List<ItemID> kids;
  final String url;
  final int score;

  Story(
    ItemID id,
    ItemType type,
    DateTime date,
    String author,
    bool deleted,
    this.title,
    this.text,
    this.descendants,
    this.kids,
    this.url,
    this.score
  ) : super(id, type, date, author, deleted);

  factory Story.fromJSON(dynamic json) {
    return Story(
      ItemID.fromJSON(json['id']),
      itemTypeFromJSON(json['type']),
      DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000),
      json['by'],
      json['deleted'],
      json['title'],
      json['text'],
      json['descendants'],
      (json['kids'] as List)?.map((entry) => ItemID.fromJSON(entry))?.toList() ?? [],
      json['url'],
      json['score']
    );
  }
}