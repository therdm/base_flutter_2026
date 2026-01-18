/// Represents a set of predefined spacing values, typically used for padding,
/// margins, or dimensions in UI layouts. Each enum case is associated with
/// an integer value.
///
/// The available sizes and their corresponding integer values are:
/// - none: 0
/// - xxxxs: 4
/// - xxxs: 8
/// - xxs: 12
/// - xs: 16
/// - s: 20
/// - m: 24
/// - l: 32
/// - xl: 40
/// - xxl: 48
/// - xxxl: 64
/// - xxxxl: 80
enum LazySpaces {
  /// No space, with a value of 0.
  none(0),

  /// Extra extra extra extra small space, with a value of 4.
  xxxxs(4),

  /// Extra extra extra small space, with a value of 8.
  xxxs(8),

  /// Extra extra small space, with a value of 12.
  xxs(12),

  /// Extra small space, with a value of 16.
  xs(16),

  /// Small space, with a value of 20.
  s(20),

  /// Medium space, with a value of 24.
  m(24),

  /// Large space, with a value of 32.
  l(32),

  /// Extra large space, with a value of 40.
  xl(40),

  /// Extra extra large space, with a value of 48.
  xxl(48),

  /// Extra extra extra large space, with a value of 64.
  xxxl(64),

  /// Extra extra extra extra large space, with a value of 80.
  xxxxl(80),

  /// Extra extra extra extra large space, with a value of 100.
  c(100);

  /// Constructs a [LazySpaces] with the given integer [value].
  const LazySpaces(this.value);

  /// The integer value associated with this space.
  final int value;

  /// Returns the [LazySpaces] corresponding to the given integer [value],
  /// or `null` if no matching enum value is found.
  static LazySpaces? fromValue(int value) {
    for (final space in LazySpaces.values) {
      if (space.value == value) {
        return space;
      }
    }
    return null;
  }
}
