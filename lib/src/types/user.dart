import 'item_id.dart';

class User {
  final String about;
  final DateTime created;
  final int delay;
  final String id;
  final int karma;
  final List<ItemID> submitted;

  User(this.about, this.created, this.delay, this.id, this.karma, this.submitted);

  factory User.fromJSON(dynamic json) {
    return User(
      json['about'],
      DateTime.fromMillisecondsSinceEpoch((json['created'] as int) * 1000),
      json['delay'],
      json['id'],
      json['karma'],
      (json['submitted'] as List).map((item) => ItemID.fromJSON(item)).toList() ?? [],
    );
  }
}