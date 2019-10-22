class Ref {
  /// unique id of native side counterpart object
  int refId;

  /// custom tag
  String tag;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ref && runtimeType == other.runtimeType && refId == other.refId;

  @override
  int get hashCode => refId.hashCode;

  @override
  String toString() {
    return '$runtimeType{refId: $refId}';
  }
}
