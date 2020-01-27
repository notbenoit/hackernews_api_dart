import 'package:hackernews/src/types/poll_option.dart';

import 'item_id.dart';
import 'job.dart';
import 'poll.dart';
import 'story.dart';
import 'comment.dart';

enum ItemType { comment, job, poll, pollopt, story }

ItemType itemTypeFromJSON(dynamic json) {
  final typeString = json.toString();
  return ItemType.values
      .firstWhere((value) => value.toString().contains(typeString));
}

/// Stories, comments, jobs, Ask HNs and even polls are just items. They're identified by their ids, which are unique integers
abstract class Item {
  final ItemID id;
  final ItemType type;
  final DateTime date;
  final String author;
  final bool deleted;

  Item(this.id, this.type, this.date, this.author, this.deleted);
  
  /// Instantiate the appropriate Item subclass depending on the read type.
  factory Item.fromJSON(dynamic json) {
    final type = itemTypeFromJSON(json['type']);
    switch (type) {
      case ItemType.comment:
        return Comment.fromJSON(json);
      case ItemType.job:
        return Job.fromJSON(json);
      case ItemType.poll:
        return Poll.fromJSON(json);
      case ItemType.pollopt:
        return PollOption.fromJSON(json);
      case ItemType.story:
        return Story.fromJSON(json);
      default:
        return null;
    }
  }
}
