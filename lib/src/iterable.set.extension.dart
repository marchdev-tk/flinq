// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Set extensions for `Iterable`
extension IterableSetExtension<T> on Iterable<T> {
  /// Returns new list of objects in which each object can
  /// occur only once
  ///
  /// The order of the elements is not guaranteed to be the same
  /// as for the iterable.
  List<T> get distinct => this.toSet().toList();

  /// Returns new list of objects filtered by `test` predicate
  /// in which each object can occur only once
  ///
  /// The order of the elements is not guaranteed to be the same
  /// as for the iterable.
  ///
  /// For more info about filtering refer to [Iterable.where].
  List<T> distinctWhere(bool test(T element)) =>
      this.where(test).toSet().toList();

  /// Returns a new list which is the intersection between this list and [other].
  ///
  /// That is, the returned list contains all the elements of this [List] that
  /// are also elements of [other] according to `other.contains`.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> intersection(List<T> other) =>
      this.toSet().intersection(other.toSet()).toList();

  /// Returns a new list which is the intersection between filtered this list
  /// by `test` predicate and [other].
  ///
  /// That is, the returned list contains all the elements of this [List] that
  /// are also elements of [other] according to `other.contains`.
  ///
  /// Note that filtering is applied to both `this` and `other` [Iterable]s.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> intersectionWhere(List<T> other, bool test(T element)) =>
      this.where(test).toSet().intersection(other.where(test).toSet()).toList();

  /// Returns a new list which contains all the elements of this list and [other].
  ///
  /// That is, the returned list contains all the elements of this [list] and
  /// all the elements of [other].
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> union(List<T> other) => this.toSet().union(other.toSet()).toList();

  /// Returns a new list which contains all the elements of filtered this list
  /// by `test` and [other].
  ///
  /// That is, the returned list contains all the elements of this [list] and
  /// all the elements of [other].
  ///
  /// Note that filtering is applied to both `this` and `other` [Iterable]s.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> unionWhere(List<T> other, bool test(T element)) =>
      this.where(test).toSet().union(other.where(test).toSet()).toList();

  /// Returns a new list with the elements of this that are not in [other].
  ///
  /// That is, the returned list contains all the elements of this [Set] that
  /// are not elements of [other] according to `other.contains`.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> difference(List<T> other) =>
      this.toSet().difference(other.toSet()).toList();

  /// Returns a new list with the elements of filtered this by `test` that
  /// are not in [other].
  ///
  /// That is, the returned list contains all the elements of this [Set] that
  /// are not elements of [other] according to `other.contains`.
  ///
  /// Note that filtering is applied to both `this` and `other` [Iterable]s.
  ///
  /// Note that `this` list and `other` will be cleared from item duplicates.
  List<T> differenceWhere(List<T> other, bool test(T element)) =>
      this.where(test).toSet().difference(other.where(test).toSet()).toList();
}
