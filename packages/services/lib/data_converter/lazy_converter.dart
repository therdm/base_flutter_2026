abstract class LazyConverter<S, T> {
  const LazyConverter();

  /// Converts [input] and returns the result of the conversion.
  T call(S input);

  S convertBack(T input) {
    // New name and default implementation
    throw UnsupportedError('$runtimeType does not support convertBack operation.');
  }
}
