// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Common extensions for `Iterable`
extension IterableCommonExtension<T> on Iterable<T> {
  /// Returns the first element.
  ///
  /// If `this` is empty, the result of invoking is [null].
  /// Otherwise returns the first element in the iteration order,
  /// equivalent to `this.elementAt(0)`.
  T get firstOrNull => this.firstWhere((_) => true, orElse: () => null);

  /// Returns the last element.
  ///
  /// If `this` is empty, the result of invoking is [null].
  /// Otherwise may iterate through the elements and returns the last one
  /// seen.
  /// Some iterables may have more efficient ways to find the last element
  /// (for example a list can directly access the last element,
  /// without iterating through the previous ones).
  T get lastOrNull => this.lastWhere((_) => true, orElse: () => null);

  /// Checks that this iterable has only one element, and returns that element.
  ///
  /// If `this` has no element, the result is [null].
  /// Throws a [StateError] if `this` has more than one element.
  T get singleOrNull => this.singleWhere((_) => true, orElse: () => null);

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If no element satisfies [test], the result of invoking is [null].
  T firstOrNullWhere(bool test(T element)) =>
      this.firstWhere(test, orElse: () => null);

  /// Returns the last element that satisfies the given predicate [test].
  ///
  /// An iterable that can access its elements directly may check its
  /// elements in any order (for example a list starts by checking the
  /// last element and then moves towards the start of the list).
  /// The default implementation iterates elements in iteration order,
  /// checks `test(element)` for each,
  /// and finally returns that last one that matched.
  ///
  /// If no element satisfies [test], the result of invoking is [null].
  T lastOrNullWhere(bool test(T element)) =>
      this.lastWhere(test, orElse: () => null);

  /// Returns the single element that satisfies [test].
  ///
  /// Checks elements to see if `test(element)` returns true.
  /// If exactly one element satisfies [test], that element is returned.
  /// If more than one matching element is found, throws [StateError].
  /// If no matching element is found, returns [null].
  T singleOrNullWhere(bool test(T element)) =>
      this.singleWhere(test, orElse: () => null);

  /// Maps [Iterable] and casts it to a [List].
  ///
  /// For more info about mapping refer to [Iterable.map].
  List<E> mapList<E>(E f(T e)) => this.map(f).toList();
}
