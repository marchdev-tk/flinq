// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart' show IterableExtension;

/// Common extensions for `Iterable`
extension IterableCommonExtension<T> on Iterable<T> {
  /// Returns the first element.
  ///
  /// If `this` is empty, the result of invoking is [null].
  /// Otherwise returns the first element in the iteration order,
  /// equivalent to `this.elementAt(0)`.
  T? get firstOrNull => this.firstWhereOrNull((_) => true);

  /// Returns the last element.
  ///
  /// If `this` is empty, the result of invoking is [null].
  /// Otherwise may iterate through the elements and returns the last one
  /// seen.
  /// Some iterables may have more efficient ways to find the last element
  /// (for example a list can directly access the last element,
  /// without iterating through the previous ones).
  T? get lastOrNull => this.lastWhereOrNull((_) => true);

  /// Checks that this iterable has only one element, and returns that element.
  ///
  /// If `this` has no element, the result is [null].
  /// Throws a [StateError] if `this` has more than one element.
  T? get singleOrNull => this.singleWhereOrNull((_) => true);

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  ///
  /// If no element satisfies [test], the result of invoking is [null].
  T? firstOrNullWhere(bool test(T element)) => this.firstWhereOrNull(test);

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
  T? lastOrNullWhere(bool test(T element)) => this.lastWhereOrNull(test);

  /// Returns the single element that satisfies [test].
  ///
  /// Checks elements to see if `test(element)` returns true.
  /// If exactly one element satisfies [test], that element is returned.
  /// If more than one matching element is found, throws [StateError].
  /// If no matching element is found, returns [null].
  T? singleOrNullWhere(bool test(T element)) => this.singleWhereOrNull(test);

  /// Maps [Iterable] and casts it to a [List].
  ///
  /// Returns a new lazy [List] with elements that are created by
  /// calling `f` on each element of this `List` in iteration order.
  ///
  /// This method returns a view of the mapped elements. As long as the
  /// returned [List] is not iterated over, the supplied function [f] will
  /// not be invoked. The transformed elements will not be cached. Iterating
  /// multiple times over the returned [List] will invoke the supplied
  /// function [f] multiple times on the same element.
  ///
  /// Methods on the returned iterable are allowed to omit calling `f`
  /// on any element where the result isn't needed.
  /// For example, [elementAt] may call `f` only once.
  List<E> mapList<E>(E f(T e)) => this.map(f).toList();

  /// Filters [Iterable] and casts it to a [List].
  ///
  /// Returns a new lazy [List] with all elements that satisfy the
  /// predicate [test].
  ///
  /// The matching elements have the same order in the returned iterable
  /// as they have in [iterator].
  ///
  /// This method returns a view of the mapped elements.
  /// As long as the returned [List] is not iterated over,
  /// the supplied function [test] will not be invoked.
  /// Iterating will not cache results, and thus iterating multiple times over
  /// the returned [List] may invoke the supplied
  List<T> whereList(bool test(T element)) => this.where(test).toList();

  /// Filters [Iterable], then mapps [Iterable] and then casts it to a [List].
  ///
  /// For more info about filtering refer to [Iterable.where].
  /// For more info about mapping refer to [Iterable.map].
  List<E> whereMapList<E>(bool test(T element), E f(T e)) =>
      this.where(test).mapList(f);

  /// Maps [Iterable], then filters [Iterable] and then casts it to a [List].
  ///
  /// For more info about mapping refer to [Iterable.map].
  /// For more info about filtering refer to [Iterable.where].
  List<E> mapWhereList<E>(E f(T e), bool test(E element)) =>
      this.map(f).whereList(test);

  /// Returns `this` iterable without any `null` values within this [Iterable].
  ///
  /// Not null items of [Iterable] is achieved by [Iterable.where].
  /// Predicate of [Iterable.where] is `(item) => item != null`.
  ///
  /// For more info about filtering refer to [Iterable.where].
  Iterable<T> get notNull => this.where((_) => _ != null).toList();

  /// Groups [Iterable] via `K by(T item)`
  ///
  /// if [this] is empty, the result of invoking is [<K, List<T>>{}]
  Map<K, List<T>> group<K>(K by(T item)) {
    final map = <K, List<T>>{};

    this.forEach((value) {
      final key = by(value);

      if (map.containsKey(key)) {
        map[key]!.add(value);
      } else {
        map[key] = <T>[value];
      }
    });

    return map;
  }

  /// Groups [Iterable] via `K by(T item)` and maps it using `V as(List<T> item)` conversion.
  ///
  /// For more info about mapping refer to [Iterable.map].
  Map<K, V> groupMap<K, V>(K by(T item), V as(List<T> item)) =>
      group(by).map((k, v) => MapEntry(k, as(v)));
}
