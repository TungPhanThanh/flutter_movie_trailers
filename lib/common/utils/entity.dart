
/// A data structure which represents a pair value structure.
/// Tuple is same as Pair construct in Java.
///
/// Tuple can be used to store a pair values [first] and [second]
/// [first] or [second] can be String, bool, int, etc.
/// For e.g:
/// - Init a Tuple: var t = Tuple(first: 1, second: true)
/// - Use Tuple:
///   t.first  // => output: 1
///   t.second  // => output: true
///
class Tuple<T1, T2> {

  /// Creates a new tuple value with the two items.
  Tuple({
    this.first,
    this.second,
  });

  /// Create a new tuple value with the specified map [items].
  factory Tuple.fromJson(Map<String, dynamic> items) {
    return Tuple(
      first: items['first'],
      second: items['second'],
    );
  }

  /// Returns the first item of the tuple
  final T1 first;

  /// Returns the second item of the tuple
  final T2 second;

}
