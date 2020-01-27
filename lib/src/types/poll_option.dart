import 'item.dart';
import 'item_id.dart';

class PollOption extends Item {
  final String text;
  final int score;
  final ItemID poll;

  PollOption(
    ItemID id,
    ItemType type,
    DateTime date,
    String author,
    bool deleted,
    this.text,
    this.score,
    this.poll
  ) : super(id, type, date, author, deleted);

  factory PollOption.fromJSON(dynamic json) {
    return PollOption(
      ItemID.fromJSON(json['id']),
      itemTypeFromJSON(json['type']),
      DateTime.fromMillisecondsSinceEpoch((json['time'] as int) * 1000),
      json['by'],
      json['deleted'], 
      json['text'],
      json['score'],
      ItemID.fromJSON(json['poll']),
    );
  }
}