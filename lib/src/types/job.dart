import 'item.dart';
import 'item_id.dart';

class Job extends Item {
  final String title;
  final String text;
  final String url;
  final int score;

  Job(
    ItemID id,
    ItemType type,
    DateTime date,
    String author,
    this.title,
    bool deleted,
    this.text,
    this.url,
    this.score
  ) : super(id, type, date, author, deleted);

  factory Job.fromJSON(dynamic json) {
    return Job(
      ItemID.fromJSON(json['id']),
      itemTypeFromJSON(json['type']),
      DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000),
      json['by'],
      json['title'],
      json['deleted'], 
      json['text'],
      json['url'],
      json['score']
    );
  }
}