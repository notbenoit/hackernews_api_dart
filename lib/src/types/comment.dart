import 'item.dart';
import 'item_id.dart';

class Comment extends Item {
  final String text;
  final List<ItemID> kids;
  final String url;

  Comment(
    ItemID id,
    ItemType type,
    DateTime date,
    String author,
    bool deleted,
    this.text,
    this.kids,
    this.url,
  ) : super(id, type, date, author, deleted);

  factory Comment.fromJSON(dynamic json) {
    return Comment(
      ItemID.fromJSON(json['id']),
      itemTypeFromJSON(json['type']),
      DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000),
      json['by'],
      json['deleted'], 
      json['text'],
      (json['kids'] as List)?.map((entry) => ItemID.fromJSON(entry))?.toList() ?? [],
      json['url']      
    );
  }
}