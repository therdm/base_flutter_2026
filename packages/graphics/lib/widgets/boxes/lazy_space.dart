import 'package:flutter/material.dart';
import 'package:graphics/widgets/boxes/lazy_spaces.dart';
export 'lazy_spaces.dart';

/// A widget that creates a box with a width and height defined by [LazySpaces] enum values.
///
/// This widget provides a convenient way to apply consistent spacing or sizing
/// using a predefined set of values from the [LazySpaces] enum.
class LazySpace extends StatelessWidget {
  /// Creates a box with the given [width] and [height] defined by [LazySpaces] enum values.
  ///
  /// The [width] and [height] arguments are optional and should be a value
  /// from the [LazySpaces] enum. If a value is provided, the box will have
  /// the corresponding integer value from the enum converted to a double.
  /// If null, the box will be as wide or as tall as its incoming constraints allow.
  ///
  /// The [child] argument is optional. If a child is provided, the
  /// [LazySpace] will attempt to size itself to the child's size,
  /// unless the [width] or [height] constraints are more restrictive.
  const LazySpace({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  const LazySpace.shrink({Key? key})
      : this(key: key, width: LazySpaces.none, height: LazySpaces.none, child: null);

  /// The width of the box, defined by a [LazySpaces] enum value.
  ///
  /// If null, the box will be as wide as its incoming constraints allow.
  final LazySpaces? width;

  /// The height of the box, defined by a [LazySpaces] enum value.
  ///
  /// If null, the box will be as tall as its incoming constraints allow.
  final LazySpaces? height;

  /// The optional child widget to be contained within the box.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.value.toDouble(),
      height: height?.value.toDouble(),
      child: child,
    );
  }
}
