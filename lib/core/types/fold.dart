class Fold<T> {
  final T? left;
  final T? right;

  Fold({
    this.left,
    this.right,
  });

  @override
  String toString() => 'Fold($left, $right)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fold &&
          runtimeType == other.runtimeType &&
          left == other.left &&
          right == other.right;

  @override
  int get hashCode => left.hashCode ^ right.hashCode;

  Fold<T> copyWith({
    T? left,
    T? right,
  }) {
    return Fold<T>(
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }

  T? getLeft() {
    return left;
  }

  T? getRight() {
    return right;
  }
}
