class ItemID {
  final int identifier;
  ItemID(this.identifier);
  factory ItemID.fromJSON(dynamic json) => ItemID(json);
}