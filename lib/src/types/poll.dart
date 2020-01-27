import 'item.dart';
import 'item_id.dart';

class Poll extends Item {
  final String title;
  final String text;
  final int descendants;
  final List<ItemID> kids;
  final List<ItemID> parts;
  final String url;
  final int score;

  Poll(
    ItemID id,
    ItemType type,
    DateTime date,
    String author,
    bool deleted,
    this.title,
    this.text,
    this.descendants,
    this.kids,
    this.parts,
    this.url,
    this.score
  ) : super(id, type, date, author, deleted);

  factory Poll.fromJSON(dynamic json) {
    return Poll(
      ItemID.fromJSON(json['id']),
      itemTypeFromJSON(json['type']),
      DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000),
      json['by'],
      json['deleted'],
      json['title'],
      json['text'],
      json['descendants'],
      (json['kids'] as List)?.map((entry) => ItemID.fromJSON(entry))?.toList() ?? [],
      (json['parts'] as List)?.map((entry) => ItemID.fromJSON(entry))?.toList() ?? [],
      json['url'],
      json['score']   
    );
  }
}